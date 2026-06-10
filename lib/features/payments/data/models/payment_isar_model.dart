import 'package:isar/isar.dart';
import '../../domain/entities/payment_entity.dart';
part 'payment_isar_model.g.dart';

@Collection()
class PaymentIsarModel {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String remoteId;

  late String studentId;
  late String month;
  late double amount;
  late bool isPaid;
  late bool isSynced;

  PaymentEntity toEntity() => PaymentEntity(
    id: remoteId,
    studentId: studentId,
    month: month,
    amount: amount,
    isPaid: isPaid,
  );

  static PaymentIsarModel fromEntity(
    PaymentEntity e, {
    bool isSynced = false,
  }) => PaymentIsarModel()
    ..remoteId = e.id
    ..studentId = e.studentId
    ..month = e.month
    ..amount = e.amount
    ..isPaid = e.isPaid
    ..isSynced = isSynced;
}
