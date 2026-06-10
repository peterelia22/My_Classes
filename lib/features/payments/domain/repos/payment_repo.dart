import 'package:dartz/dartz.dart';
import 'package:my_classes/core/errors/failures.dart';
import '../entities/payment_entity.dart';

abstract class PaymentRepo {
  Future<Either<Failure, List<PaymentEntity>>> getPaymentsByStudent(
    String studentId,
  );
  Future<Either<Failure, List<PaymentEntity>>> getAllPayments();
  Future<Either<Failure, void>> addPayment(PaymentEntity payment);
  Future<Either<Failure, void>> updatePayment(PaymentEntity payment);
  Future<Either<Failure, void>> deletePayment(String id);
  Future<Either<Failure, void>> syncUnsyncedPayments();
}
