import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:my_classes/core/errors/exceptions.dart';
import 'package:my_classes/core/errors/failures.dart';
import 'package:my_classes/core/network/network_info.dart';
import 'package:my_classes/features/payments/data/datasources/payment_local_datasource.dart';
import 'package:my_classes/features/payments/data/datasources/payment_remote_datasource.dart';
import 'package:my_classes/features/payments/data/models/payment_isar_model.dart';
import 'package:my_classes/features/payments/data/models/payment_model.dart';
import 'package:my_classes/features/payments/domain/entities/payment_entity.dart';
import 'package:my_classes/features/payments/domain/repos/payment_repo.dart';
import 'package:uuid/uuid.dart';

class PaymentRepoImpl implements PaymentRepo {
  final PaymentRemoteDatasource remote;
  final PaymentLocalDatasource local;
  final NetworkInfo network;

  PaymentRepoImpl({
    required this.remote,
    required this.local,
    required this.network,
  });

  @override
  Future<Either<Failure, List<PaymentEntity>>> getPaymentsByStudent(
    String studentId,
  ) async {
    try {
      if (await network.isConnected) {
        await syncUnsyncedPayments();
        final payments = await remote.getPaymentsByStudent(studentId);
        await local.savePayments(
          payments
              .map((e) => PaymentIsarModel.fromEntity(e, isSynced: true))
              .toList(),
        );
        return Right(payments);
      } else {
        final local_ = await local.getPaymentsByStudent(studentId);
        return Right(local_.map((e) => e.toEntity()).toList());
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ServerFailure('لا يوجد اتصال بالإنترنت'));
    } catch (e, s) {
      log(
        'PaymentRepoImpl.getPaymentsByStudent failed',
        error: e,
        stackTrace: s,
      );
      return Left(ServerFailure('حدث خطأ أثناء تحميل المدفوعات'));
    }
  }

  @override
  Future<Either<Failure, List<PaymentEntity>>> getAllPayments() async {
    try {
      if (await network.isConnected) {
        await syncUnsyncedPayments();
        final payments = await remote.getAllPayments();
        await local.savePayments(
          payments
              .map((e) => PaymentIsarModel.fromEntity(e, isSynced: true))
              .toList(),
        );
        return Right(payments);
      } else {
        final local_ = await local.getAllPayments();
        return Right(local_.map((e) => e.toEntity()).toList());
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ServerFailure('لا يوجد اتصال بالإنترنت'));
    } catch (e, s) {
      log('PaymentRepoImpl.getAllPayments failed', error: e, stackTrace: s);
      return Left(ServerFailure('حدث خطأ أثناء تحميل المدفوعات'));
    }
  }

  @override
  Future<Either<Failure, void>> addPayment(PaymentEntity payment) async {
    try {
      final isarModel = PaymentIsarModel.fromEntity(payment, isSynced: false)
        ..remoteId = const Uuid().v4();
      await local.savePayment(isarModel);

      if (await network.isConnected) {
        await remote.addPayment(PaymentModel.fromEntity(payment));
        isarModel.isSynced = true;
        await local.savePayment(isarModel);
      }
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(
        ServerFailure('تم الحفظ محلياً وسيتم المزامنة عند عودة الإنترنت'),
      );
    } catch (e, s) {
      log('PaymentRepoImpl.addPayment failed', error: e, stackTrace: s);
      return Left(ServerFailure('حدث خطأ أثناء إضافة الدفعة'));
    }
  }

  @override
  Future<Either<Failure, void>> updatePayment(PaymentEntity payment) async {
    try {
      final isarModel = PaymentIsarModel.fromEntity(payment, isSynced: false);
      await local.savePayment(isarModel);

      if (await network.isConnected) {
        await remote.updatePayment(PaymentModel.fromEntity(payment));
        isarModel.isSynced = true;
        await local.savePayment(isarModel);
      }
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(
        ServerFailure('تم التعديل محلياً وسيتم المزامنة عند عودة الإنترنت'),
      );
    } catch (e, s) {
      log('PaymentRepoImpl.updatePayment failed', error: e, stackTrace: s);
      return Left(ServerFailure('حدث خطأ أثناء تعديل الدفعة'));
    }
  }

  @override
  Future<Either<Failure, void>> deletePayment(String id) async {
    try {
      await local.deletePayment(id);
      if (await network.isConnected) {
        await remote.deletePayment(id);
      }
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(
        ServerFailure('تم الحذف محلياً وسيتم المزامنة عند عودة الإنترنت'),
      );
    } catch (e, s) {
      log('PaymentRepoImpl.deletePayment failed', error: e, stackTrace: s);
      return Left(ServerFailure('حدث خطأ أثناء حذف الدفعة'));
    }
  }

  @override
  Future<Either<Failure, void>> syncUnsyncedPayments() async {
    try {
      if (await network.isConnected) {
        final unsynced = await local.getUnsyncedPayments();
        if (unsynced.isEmpty) return const Right(null);

        for (final isarModel in unsynced) {
          await remote.addPayment(
            PaymentModel.fromEntity(isarModel.toEntity()),
          );
          isarModel.isSynced = true;
          await local.savePayment(isarModel);
        }
        log('تمت مزامنة المدفوعات بنجاح!');
      }
      return const Right(null);
    } catch (e, s) {
      log('خطأ أثناء مزامنة المدفوعات', error: e, stackTrace: s);
      return Left(ServerFailure('فشلت عملية المزامنة'));
    }
  }
}
