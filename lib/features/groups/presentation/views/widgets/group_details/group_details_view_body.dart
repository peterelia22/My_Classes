import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/show_app_bottom_sheet.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/app_delete_confirmation_dialog.dart';
import '../../../../../../core/widgets/app_details_actions_row.dart';
import '../../../../../../core/widgets/app_details_header_card.dart';
import '../../../../domain/entities/group_entity.dart';
import '../../../cubits/groups_cubit.dart';
import '../group_bottom_sheet.dart';
import 'group_details_schedule_card.dart';

class GroupDetailsViewBody extends StatelessWidget {
  final GroupEntity group;

  const GroupDetailsViewBody({super.key, required this.group});

  void _showEditBottomSheet(BuildContext context) {
    showAppBottomSheet(
      context: context,
      providers: [BlocProvider.value(value: context.read<GroupsCubit>())],
      child: GroupBottomSheet(group: group),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          group.name,
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
            AppDetailsHeaderCard(
              icon: Icons.group_outlined,
              title: group.name,
              subtitle: '${group.gradeLevel} — ${group.academicYear}',
            ),
            const SizedBox(height: 20),
            GroupDetailsScheduleCard(group: group),
            const SizedBox(height: 40),
            AppDetailsActionsRow(
              deleteLabel: 'حذف المجموعة',
              onEdit: () => _showEditBottomSheet(context),
              onDelete: () {
                AppDeleteConfirmationDialog.show(
                  context: context,
                  title: 'حذف المجموعة',
                  content:
                      'هل أنت متأكد من رغبتك في حذف مجموعة "${group.name}"؟ لا يمكن التراجع عن هذا الإجراء.',
                  onDelete: () =>
                      context.read<GroupsCubit>().deleteGroup(group.id),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
