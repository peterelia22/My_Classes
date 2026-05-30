import '../../domain/entities/group_entity.dart';

class GroupModel extends GroupEntity {
  const GroupModel({
    required super.id,
    required super.name,
    required super.academicYear,
    required super.gradeLevel,
    required super.day1,
    required super.time1,
    required super.day2,
    required super.time2,
    required super.sessionDuration,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
    id: json['id'],
    name: json['name'],
    academicYear: json['academic_year'],
    gradeLevel: json['grade_level'],
    day1: json['day_1'],
    time1: json['time_1'],
    day2: json['day_2'],
    time2: json['time_2'],
    sessionDuration: json['session_duration'] ?? 60,
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'academic_year': academicYear,
    'grade_level': gradeLevel,
    'day_1': day1,
    'time_1': time1,
    'day_2': day2,
    'time_2': time2,
    'session_duration': sessionDuration,
  };
}
