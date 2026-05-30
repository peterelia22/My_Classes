class GroupEntity {
  final String id;
  final String name;
  final String academicYear;
  final String gradeLevel;
  final String day1;
  final String time1;
  final String day2;
  final String time2;
  final int sessionDuration;

  const GroupEntity({
    required this.id,
    required this.name,
    required this.academicYear,
    required this.gradeLevel,
    required this.day1,
    required this.time1,
    required this.day2,
    required this.time2,
    required this.sessionDuration,
  });
}
