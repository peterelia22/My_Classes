import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/group_entity.dart';
import '../../cubits/groups_cubit.dart';

class DeleteGroupDialog extends StatelessWidget {
  final GroupEntity group;

  const DeleteGroupDialog({super.key, required this.group});

  static void show(BuildContext context, GroupEntity group) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<GroupsCubit>(),
          child: DeleteGroupDialog(group: group),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
          onPressed: () => Navigator.pop(context),
          child: Text(
            'إلغاء',
            style: AppTextStyles.button.copyWith(
              color: AppColors.textSecondaryColor,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
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
  }
}
