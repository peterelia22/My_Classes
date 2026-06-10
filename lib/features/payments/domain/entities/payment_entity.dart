class PaymentEntity {
  final String id;
  final String studentId;
  final String month;
  final double amount;
  final bool isPaid;

  const PaymentEntity({
    required this.id,
    required this.studentId,
    required this.month,
    required this.amount,
    required this.isPaid,
  });
}
