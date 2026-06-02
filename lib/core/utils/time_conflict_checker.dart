import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

class TimeConflictChecker {
  static bool hasConflict(List<GroupEntity> groups, GroupEntity newGroup) {
    if (isDayConflict(
      existingDay: newGroup.day1,
      existingTime: newGroup.time1,
      existingDuration: newGroup.sessionDuration,
      newDay: newGroup.day2,
      newTime: newGroup.time2,
      newDuration: newGroup.sessionDuration,
    )) {
      return true;
    }

    for (final group in groups) {
      final existingSlots = [
        (day: group.day1, time: group.time1),
        (day: group.day2, time: group.time2),
      ];
      final newSlots = [
        (day: newGroup.day1, time: newGroup.time1),
        (day: newGroup.day2, time: newGroup.time2),
      ];

      for (final existing in existingSlots) {
        for (final newSlot in newSlots) {
          if (isDayConflict(
            existingDay: existing.day,
            existingTime: existing.time,
            existingDuration: group.sessionDuration,
            newDay: newSlot.day,
            newTime: newSlot.time,
            newDuration: newGroup.sessionDuration,
          )) {
            return true;
          }
        }
      }
    }
    return false;
  }

  static bool isDayConflict({
    required String existingDay,
    required String existingTime,
    required int existingDuration,
    required String newDay,
    required String newTime,
    required int newDuration,
  }) {
    if (existingDay != newDay) return false;

    final existingStart = timeToMinutes(existingTime);
    final existingEnd = existingStart + existingDuration;
    final newStart = timeToMinutes(newTime);
    final newEnd = newStart + newDuration;

    return newStart < existingEnd && newEnd > existingStart;
  }

  static int timeToMinutes(String time) {
    final parts = time.split(':');
    return int.parse(parts[0]) * 60 + int.parse(parts[1]);
  }
}
