import 'package:my_classes/core/constants/backend_endpoints.dart';
import 'package:my_classes/core/errors/exceptions.dart';
import 'package:my_classes/core/services/supbase_database_service.dart';
import '../models/payment_model.dart';

class PaymentRemoteDatasource {
  final SupabaseDatabaseService db;
  PaymentRemoteDatasource({required this.db});

  Future<List<PaymentModel>> getPaymentsByStudent(String studentId) async {
    try {
      final data = await db.getData(
        path: BackendEndpoints.payments,
        query: {'student_id': studentId},
      );
      return (data as List).map((e) => PaymentModel.fromJson(e)).toList();
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<List<PaymentModel>> getAllPayments() async {
    try {
      final data = await db.getData(path: BackendEndpoints.payments);
      return (data as List).map((e) => PaymentModel.fromJson(e)).toList();
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<void> addPayment(PaymentModel payment) async {
    try {
      await db.addData(path: BackendEndpoints.payments, data: payment.toMap());
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<void> updatePayment(PaymentModel payment) async {
    try {
      await db.updateData(
        path: BackendEndpoints.payments,
        documentId: payment.id,
        data: payment.toMap(),
      );
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  Future<void> deletePayment(String id) async {
    try {
      await db.deleteData(path: BackendEndpoints.payments, documentId: id);
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
