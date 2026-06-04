import 'package:flutter/material.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

class CalendarLegend extends StatelessWidget {
  final List<GroupEntity> groups;

  const CalendarLegend({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: List.generate(groups.length, (i) {
        final ci = i % AppColors.sessionBgColors.length;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.sessionBgColors[ci],
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: AppColors.sessionSubTextColors[ci].withOpacity(0.4),
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              groups[i].name,
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.textSecondaryColor,
              ),
            ),
          ],
        );
      }),
    );
  }
}
