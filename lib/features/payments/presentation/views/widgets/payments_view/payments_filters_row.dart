import 'package:flutter/material.dart';
import 'package:my_classes/core/constants/app_constants.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

class PaymentsFiltersRow extends StatelessWidget {
  final String selectedMonth;
  final String? selectedGroupId;
  final List<GroupEntity> groups;
  final ValueChanged<String> onMonthChanged;
  final ValueChanged<String?> onGroupChanged;

  const PaymentsFiltersRow({
    super.key,
    required this.selectedMonth,
    this.selectedGroupId,
    required this.groups,
    required this.onMonthChanged,
    required this.onGroupChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedMonth,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondaryColor),
                dropdownColor: AppColors.surfaceColor,
                items: AppConstants.months.map((month) {
                  return DropdownMenuItem(
                    value: month,
                    child: Text(
                      month,
                      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimaryColor),
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) onMonthChanged(val);
                },
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String?>(
                value: selectedGroupId,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondaryColor),
                dropdownColor: AppColors.surfaceColor,
                hint: Text(
                  'كل المجموعات',
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimaryColor),
                ),
                items: [
                  DropdownMenuItem<String?>(
                    value: null,
                    child: Text(
                      'كل المجموعات',
                      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimaryColor),
                    ),
                  ),
                  ...groups.map((group) {
                    return DropdownMenuItem<String?>(
                      value: group.id,
                      child: Text(
                        group.name,
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }),
                ],
                onChanged: onGroupChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
