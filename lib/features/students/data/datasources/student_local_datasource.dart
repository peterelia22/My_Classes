import 'package:isar/isar.dart';

import '../../../../core/services/isar_service.dart';
import '../models/student_isar_model.dart';

class StudentLocalDatasource {
  final IsarService isarService;
  StudentLocalDatasource({required this.isarService});

  Future<List<StudentIsarModel>> getStudentsByGroup(String groupId) async {
    return await isarService.isar.studentIsarModels
        .filter()
        .groupIdEqualTo(groupId)
        .findAll();
  }

  Future<void> saveStudent(StudentIsarModel student) async {
    await isarService.isar.writeTxn(() async {
      await isarService.isar.studentIsarModels.putByRemoteId(student);
    });
  }

  Future<void> saveStudents(List<StudentIsarModel> students) async {
    await isarService.isar.writeTxn(() async {
      for (final student in students) {
        await isarService.isar.studentIsarModels.putByRemoteId(student);
      }
    });
  }

  Future<void> deleteStudent(String remoteId) async {
    await isarService.isar.writeTxn(() async {
      await isarService.isar.studentIsarModels
          .filter()
          .remoteIdEqualTo(remoteId)
          .deleteFirst();
    });
  }

  Future<List<StudentIsarModel>> getUnsyncedStudents() async {
    return await isarService.isar.studentIsarModels
        .filter()
        .isSyncedEqualTo(false)
        .findAll();
  }
}
