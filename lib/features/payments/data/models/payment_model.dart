import '../../domain/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  const PaymentModel({
    required super.id,
    required super.studentId,
    required super.month,
    required super.amount,
    required super.isPaid,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    id: json['id'],
    studentId: json['student_id'],
    month: json['month'],
    amount: (json['amount'] as num).toDouble(),
    isPaid: json['is_paid'] ?? false,
  );

  factory PaymentModel.fromEntity(PaymentEntity e) => PaymentModel(
    id: e.id,
    studentId: e.studentId,
    month: e.month,
    amount: e.amount,
    isPaid: e.isPaid,
  );

  Map<String, dynamic> toMap() => {
    'student_id': studentId,
    'month': month,
    'amount': amount,
    'is_paid': isPaid,
  };
}
