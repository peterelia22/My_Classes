import 'package:isar/isar.dart';
import '../../domain/entities/student_entity.dart';
part 'student_isar_model.g.dart';

@Collection()
class StudentIsarModel {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String remoteId;

  late String name;
  late String phone;
  late String groupId;
  late String gradeLevel;
  late String email;
  String? supabaseUserId;
  String? tempPassword;
  late bool isSynced;

  StudentEntity toEntity() => StudentEntity(
    id: remoteId,
    name: name,
    phone: phone,
    groupId: groupId,
    gradeLevel: gradeLevel,
    email: email,
    supabaseUserId: supabaseUserId,
  );

  static StudentIsarModel fromEntity(
    StudentEntity e, {
    bool isSynced = false,
  }) => StudentIsarModel()
    ..remoteId = e.id
    ..name = e.name
    ..phone = e.phone
    ..groupId = e.groupId
    ..gradeLevel = e.gradeLevel
    ..email = e.email
    ..supabaseUserId = e.supabaseUserId
    ..isSynced = isSynced;
}
