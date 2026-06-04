import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

import 'session_item.dart';

abstract class CalendarUtils {
  static String endTime(String start, int durationMinutes) {
    final parts = start.split(':');
    final total =
        int.parse(parts[0]) * 60 + int.parse(parts[1]) + durationMinutes;
    return '${(total ~/ 60).toString().padLeft(2, '0')}:${(total % 60).toString().padLeft(2, '0')}';
  }

  static List<SessionItem> getSessionsForDay(
    List<GroupEntity> groups,
    String day,
  ) {
    final sessions = <SessionItem>[];

    for (int i = 0; i < groups.length; i++) {
      final g = groups[i];
      final ci = i % AppColors.sessionBgColors.length;

      if (g.day1 == day) {
        sessions.add(
          SessionItem(
            groupName: g.name,
            time: g.time1,
            duration: g.sessionDuration,
            bgColor: AppColors.sessionBgColors[ci],
            textColor: AppColors.sessionTextColors[ci],
            subTextColor: AppColors.sessionSubTextColors[ci],
          ),
        );
      }

      if (g.day2 == day) {
        sessions.add(
          SessionItem(
            groupName: g.name,
            time: g.time2,
            duration: g.sessionDuration,
            bgColor: AppColors.sessionBgColors[ci],
            textColor: AppColors.sessionTextColors[ci],
            subTextColor: AppColors.sessionSubTextColors[ci],
          ),
        );
      }
    }

    sessions.sort((a, b) => a.time.compareTo(b.time));
    return sessions;
  }
}
