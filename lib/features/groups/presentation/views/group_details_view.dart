import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/helpers/build_snack_bar.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/core/widgets/custom_progress_hud.dart';
import 'package:my_classes/features/groups/presentation/views/widgets/group_bottom_sheet.dart';
import '../../domain/entities/group_entity.dart';
import '../cubits/groups_cubit.dart';
import '../cubits/groups_state.dart';

class GroupDetailsView extends StatelessWidget {
  static const String routeName = '/group-details';
  final GroupEntity group;

  const GroupDetailsView({super.key, required this.group});

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'حذف المجموعة',
            style: AppTextStyles.headlineSmall.copyWith(
              color: AppColors.errorColor,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'هل أنت متأكد من رغبتك في حذف مجموعة "${group.name}"؟ لا يمكن التراجع عن هذا الإجراء.',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(
                'إلغاء',
                style: AppTextStyles.button.copyWith(
                  color: AppColors.textSecondaryColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                context.read<GroupsCubit>().deleteGroup(group.id);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.errorColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'حذف',
                style: AppTextStyles.button.copyWith(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return BlocProvider.value(
          value: context.read<GroupsCubit>(),
          child: GroupBottomSheet(group: group),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupsCubit, GroupsState>(
      listener: (context, state) {
        if (state is GroupActionFailure) {
          buildSnackBar(
            context: context,
            title: 'خطأ',
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        }
        if (state is GroupActionSuccess || state is GroupDeleteSuccess) {
          buildSnackBar(
            context: context,
            title: 'نجح',
            message: state is GroupDeleteSuccess
                ? 'تم حذف المجموعة بنجاح'
                : 'تم تحديث المجموعات بنجاح',
            contentType: ContentType.success,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        // Find the group in current list to reflect edits
        final cubit = context.read<GroupsCubit>();
        final currentGroup = cubit.currentGroups.cast<GroupEntity>().firstWhere(
          (g) => g.id == group.id,
          orElse: () => group,
        );

        return CustomProgressHud(
          isLoading: state is GroupsLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                currentGroup.name,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.textPrimaryColor,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.textPrimaryColor,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Main Info Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 0.5,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.group_outlined,
                          size: 48,
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          currentGroup.name,
                          style: AppTextStyles.headlineMedium.copyWith(
                            color: AppColors.textPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${currentGroup.gradeLevel} — ${currentGroup.academicYear}',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Schedule Info Card
                  Text(
                    'مواعيد المجموعة',
                    style: AppTextStyles.titleLarge.copyWith(
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildDetailRow(
                          icon: Icons.calendar_today,
                          label: 'اليوم الأول',
                          value:
                              '${currentGroup.day1} في ${currentGroup.time1}',
                        ),
                        const Divider(
                          color: AppColors.dividerColor,
                          height: 24,
                        ),
                        _buildDetailRow(
                          icon: Icons.calendar_today,
                          label: 'اليوم الثاني',
                          value:
                              '${currentGroup.day2} في ${currentGroup.time2}',
                        ),
                        const Divider(
                          color: AppColors.dividerColor,
                          height: 24,
                        ),
                        _buildDetailRow(
                          icon: Icons.hourglass_top,
                          label: 'مدة الحصة',
                          value: '${currentGroup.sessionDuration} دقيقة',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _showEditBottomSheet(context),
                          icon: const Icon(Icons.edit, size: 18),
                          label: const Text('تعديل البيانات'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: AppTextStyles.button,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _showDeleteDialog(context),
                          icon: const Icon(Icons.delete_outline, size: 18),
                          label: const Text('حذف المجموعة'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.errorColor,
                            side: const BorderSide(color: AppColors.errorColor),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: AppTextStyles.button,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primaryColor),
        const SizedBox(width: 12),
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondaryColor,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.textPrimaryColor,
          ),
        ),
      ],
    );
  }
}
