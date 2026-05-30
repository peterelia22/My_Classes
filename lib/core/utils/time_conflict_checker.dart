import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

class TimeConflictChecker {
  static bool hasConflict(List<GroupEntity> groups, GroupEntity newGroup) {
    for (final group in groups) {
      if (isDayConflict(
        existingDay: group.day1,
        existingTime: group.time1,
        existingDuration: group.sessionDuration,
        newDay: newGroup.day1,
        newTime: newGroup.time1,
        newDuration: newGroup.sessionDuration,
      )) {
        return true;
      }

      if (isDayConflict(
        existingDay: group.day2,
        existingTime: group.time2,
        existingDuration: group.sessionDuration,
        newDay: newGroup.day1,
        newTime: newGroup.time1,
        newDuration: newGroup.sessionDuration,
      ))
        return true;

      if (isDayConflict(
        existingDay: group.day1,
        existingTime: group.time1,
        existingDuration: group.sessionDuration,
        newDay: newGroup.day2,
        newTime: newGroup.time2,
        newDuration: newGroup.sessionDuration,
      ))
        return true;

      if (isDayConflict(
        existingDay: group.day2,
        existingTime: group.time2,
        existingDuration: group.sessionDuration,
        newDay: newGroup.day2,
        newTime: newGroup.time2,
        newDuration: newGroup.sessionDuration,
      ))
        return true;
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
