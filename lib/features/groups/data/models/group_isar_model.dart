import 'package:isar/isar.dart';
import '../../domain/entities/group_entity.dart';
part 'group_isar_model.g.dart';

@Collection()
class GroupIsarModel {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String remoteId;

  late String name;
  late String academicYear;
  late String gradeLevel;
  late String day1;
  late String time1;
  late String day2;
  late String time2;
  late int sessionDuration;
  late bool isSynced;

  GroupEntity toEntity() => GroupEntity(
    id: remoteId,
    name: name,
    academicYear: academicYear,
    gradeLevel: gradeLevel,
    day1: day1,
    time1: time1,
    day2: day2,
    time2: time2,
    sessionDuration: sessionDuration,
  );

  static GroupIsarModel fromEntity(GroupEntity e, {bool isSynced = false}) =>
      GroupIsarModel()
        ..remoteId = e.id
        ..name = e.name
        ..academicYear = e.academicYear
        ..gradeLevel = e.gradeLevel
        ..day1 = e.day1
        ..time1 = e.time1
        ..day2 = e.day2
        ..time2 = e.time2
        ..sessionDuration = e.sessionDuration
        ..isSynced = isSynced;
}
