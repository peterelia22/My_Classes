import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:my_classes/core/errors/exceptions.dart';
import 'package:my_classes/core/errors/failures.dart';
import 'package:my_classes/core/network/network_info.dart';
import 'package:my_classes/features/students/data/datasources/student_local_datasource.dart';
import 'package:my_classes/features/students/data/datasources/student_remote_datasource.dart';
import 'package:my_classes/features/students/data/models/student_isar_model.dart';
import 'package:my_classes/features/students/data/models/student_model.dart';
import 'package:my_classes/features/students/domain/entities/student_entity.dart';
import 'package:my_classes/features/students/domain/repos/student_repo.dart';
import 'package:uuid/uuid.dart';

class StudentRepoImpl implements StudentRepo {
  final StudentRemoteDatasource remote;
  final StudentLocalDatasource local;
  final NetworkInfo network;

  StudentRepoImpl({
    required this.remote,
    required this.local,
    required this.network,
  });

  @override
  Future<Either<Failure, void>> addStudent({
    required StudentEntity student,
    required String password,
  }) async {
    try {
      final isarModel = StudentIsarModel.fromEntity(student, isSynced: false)
        ..remoteId = const Uuid().v4();
      await local.saveStudent(isarModel);

      if (await network.isConnected) {
        await remote.addStudent(
          name: student.name,
          email: student.email,
          password: password,
          groupId: student.groupId,
          gradeLevel: student.gradeLevel,
          phone: student.phone,
        );
        isarModel.isSynced = true;
        await local.saveStudent(isarModel);
      }
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(
        ServerFailure('تم الحفظ محلياً وسيتم المزامنة عند عودة الإنترنت'),
      );
    } catch (e, stackTrace) {
      log(
        'StudentRepoImpl.addStudent failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('حدث خطأ أثناء إضافة الطالب'));
    }
  }

  @override
  Future<Either<Failure, void>> updateStudent(StudentEntity student) async {
    try {
      final isarModel = StudentIsarModel.fromEntity(student, isSynced: false);
      await local.saveStudent(isarModel);

      if (await network.isConnected) {
        await remote.updateStudent(StudentModel.fromEntity(student));
        isarModel.isSynced = true;
        await local.saveStudent(isarModel);
      }
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(
        ServerFailure('تم التعديل محلياً وسيتم المزامنة عند عودة الإنترنت'),
      );
    } catch (e, stackTrace) {
      log(
        'StudentRepoImpl.updateStudent failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('حدث خطأ أثناء تعديل الطالب'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteStudent(String id) async {
    try {
      await local.deleteStudent(id);
      if (await network.isConnected) {
        await remote.deleteStudent(id);
      }
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(
        ServerFailure('تم الحذف محلياً وسيتم المزامنة عند عودة الإنترنت'),
      );
    } catch (e, stackTrace) {
      log(
        'StudentRepoImpl.deleteStudent failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('حدث خطأ أثناء حذف الطالب'));
    }
  }

  @override
  Future<Either<Failure, void>> syncUnsyncedStudents() async {
    try {
      if (await network.isConnected) {
        final unsynced = await local.getUnsyncedStudents();
        if (unsynced.isEmpty) return const Right(null);

        for (final isarModel in unsynced) {
          await remote.addStudent(
            name: isarModel.name,
            email: isarModel.email,
            password: isarModel.tempPassword ?? '',
            groupId: isarModel.groupId,
            gradeLevel: isarModel.gradeLevel,
            phone: isarModel.phone,
          );
          isarModel.isSynced = true;
          await local.saveStudent(isarModel);
        }
        log('تمت مزامنة الطلاب بنجاح!');
      }
      return const Right(null);
    } catch (e, stackTrace) {
      log('خطأ أثناء مزامنة الطلاب', error: e, stackTrace: stackTrace);
      return Left(ServerFailure('فشلت عملية المزامنة'));
    }
  }

  @override
  Future<Either<Failure, List<StudentEntity>>> getAllStudents() async {
    try {
      if (await network.isConnected) {
        final students = await remote.getAllStudents();
        final isarStudents = students
            .map((e) => StudentIsarModel.fromEntity(e, isSynced: true))
            .toList();
        await local.saveStudents(isarStudents);
        return Right(students);
      } else {
        final localStudents = await local.getAllStudents();
        return Right(localStudents.map((e) => e.toEntity()).toList());
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ServerFailure('لا يوجد اتصال بالإنترنت'));
    } catch (e, stackTrace) {
      log(
        'StudentRepoImpl.getAllStudents failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(ServerFailure('حدث خطأ أثناء تحميل الطلاب'));
    }
  }
}
