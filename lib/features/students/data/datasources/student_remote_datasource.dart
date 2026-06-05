import 'package:my_classes/core/constants/backend_endpoints.dart';
import 'package:my_classes/core/errors/exceptions.dart';
import 'package:my_classes/core/services/supbase_database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/student_model.dart';

class StudentRemoteDatasource {
  final SupabaseDatabaseService db;
  StudentRemoteDatasource({required this.db});

  Future<List<StudentModel>> getStudentsByGroup(String groupId) async {
    try {
      final data = await db.getData(
        path: BackendEndpoints.students,
        query: {'group_id': groupId},
      );
      return (data as List).map((e) => StudentModel.fromJson(e)).toList();
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<String> addStudent({
    required String name,
    required String email,
    required String password,
    required String groupId,
    required String gradeLevel,
    required String phone,
  }) async {
    try {
      final response = await Supabase.instance.client.rpc(
        'create_student_user',
        params: {
          'student_email': email,
          'student_password': password,
          'student_name': name,
          'p_group_id': groupId,
          'student_phone': phone,
          'student_grade_level': gradeLevel,
        },
      );
      return response as String;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<void> updateStudent(StudentModel student) async {
    try {
      await db.updateData(
        path: BackendEndpoints.students,
        documentId: student.id,
        data: student.toMap(),
      );
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      await db.deleteData(path: BackendEndpoints.students, documentId: id);
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
