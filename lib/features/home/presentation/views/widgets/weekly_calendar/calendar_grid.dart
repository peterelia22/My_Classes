import 'package:flutter/material.dart';
import 'package:my_classes/core/constants/app_constants.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

import 'calendar_day_column.dart';
import 'calendar_utils.dart';

class CalendarGrid extends StatelessWidget {
  final List<GroupEntity> groups;

  const CalendarGrid({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor, width: 0.5),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.surfaceColor,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            children: List.generate(AppConstants.days.length * 2 - 1, (i) {
              if (i.isOdd) {
                return VerticalDivider(
                  width: 0.5,
                  thickness: 0.5,
                  color: AppColors.borderColor,
                );
              }
              final day = AppConstants.days[i ~/ 2];
              return CalendarDayColumn(
                day: day,
                sessions: CalendarUtils.getSessionsForDay(groups, day),
              );
            }),
          ),
        ),
      ),
    );
  }
}
