import 'package:flutter/material.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';

class CalendarHeader extends StatelessWidget {
  final int groupCount;

  const CalendarHeader({super.key, required this.groupCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'جدول الأسبوع',
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimaryColor,
          ),
        ),
        Text(
          '$groupCount مجموعات',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondaryColor,
          ),
        ),
      ],
    );
  }
}
