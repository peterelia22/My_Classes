import 'package:flutter/material.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

import 'calendar_grid.dart';
import 'calendar_header.dart';
import 'calendar_legend.dart';

class WeeklyCalendarWidget extends StatelessWidget {
  final List<GroupEntity> groups;

  const WeeklyCalendarWidget({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CalendarHeader(groupCount: groups.length),
        const SizedBox(height: 12),
        CalendarGrid(groups: groups),
        const SizedBox(height: 12),
        if (groups.isNotEmpty) CalendarLegend(groups: groups),
      ],
    );
  }
}
