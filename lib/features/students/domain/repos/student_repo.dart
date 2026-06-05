import 'package:dartz/dartz.dart';
import 'package:my_classes/core/errors/failures.dart';
import '../entities/student_entity.dart';

abstract class StudentRepo {
  Future<Either<Failure, List<StudentEntity>>> getStudentsByGroup(
    String groupId,
  );
  Future<Either<Failure, void>> addStudent({
    required StudentEntity student,
    required String password,
  });
  Future<Either<Failure, void>> updateStudent(StudentEntity student);
  Future<Either<Failure, void>> deleteStudent(String id);
  Future<Either<Failure, void>> syncUnsyncedStudents();
}
