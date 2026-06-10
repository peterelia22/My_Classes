import 'package:isar/isar.dart';
import 'package:my_classes/core/services/isar_service.dart';
import '../models/payment_isar_model.dart';

class PaymentLocalDatasource {
  final IsarService isarService;
  PaymentLocalDatasource({required this.isarService});

  Future<List<PaymentIsarModel>> getPaymentsByStudent(String studentId) async {
    return await isarService.isar.paymentIsarModels
        .filter()
        .studentIdEqualTo(studentId)
        .findAll();
  }

  Future<List<PaymentIsarModel>> getAllPayments() async {
    return await isarService.isar.paymentIsarModels.where().findAll();
  }

  Future<void> savePayment(PaymentIsarModel payment) async {
    await isarService.isar.writeTxn(() async {
      await isarService.isar.paymentIsarModels.putByRemoteId(payment);
    });
  }

  Future<void> savePayments(List<PaymentIsarModel> payments) async {
    await isarService.isar.writeTxn(() async {
      for (final p in payments) {
        await isarService.isar.paymentIsarModels.putByRemoteId(p);
      }
    });
  }

  Future<void> deletePayment(String remoteId) async {
    await isarService.isar.writeTxn(() async {
      await isarService.isar.paymentIsarModels
          .filter()
          .remoteIdEqualTo(remoteId)
          .deleteFirst();
    });
  }

  Future<List<PaymentIsarModel>> getUnsyncedPayments() async {
    return await isarService.isar.paymentIsarModels
        .filter()
        .isSyncedEqualTo(false)
        .findAll();
  }
}
