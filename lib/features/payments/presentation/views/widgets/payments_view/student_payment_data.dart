import 'package:my_classes/features/payments/domain/entities/payment_entity.dart';
import 'package:my_classes/features/students/domain/entities/student_entity.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

class StudentPaymentData {
  final StudentEntity student;
  final GroupEntity? group;
  final PaymentEntity? existingPayment;
  final bool isPaid;

  StudentPaymentData({
    required this.student,
    required this.group,
    required this.existingPayment,
    required this.isPaid,
  });
}
