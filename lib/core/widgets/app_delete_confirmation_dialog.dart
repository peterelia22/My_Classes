import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class AppDeleteConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onDelete;

  const AppDeleteConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onDelete,
  });

  static void show({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onDelete,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AppDeleteConfirmationDialog(
          title: title,
          content: content,
          onDelete: onDelete,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        title,
        style: AppTextStyles.headlineSmall.copyWith(
          color: AppColors.errorColor,
        ),
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
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
            onDelete();
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
