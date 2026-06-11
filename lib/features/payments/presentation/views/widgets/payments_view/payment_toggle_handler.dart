import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:my_classes/features/payments/presentation/cubits/payments_cubit.dart';
import 'package:my_classes/features/payments/domain/entities/payment_entity.dart';

void handleTogglePayment({
  required BuildContext context,
  required bool isPaid,
  required String studentId,
  required String selectedMonth,
  required PaymentEntity? existingPayment,
}) {
  if (existingPayment != null) {
    final updated = PaymentEntity(
      id: existingPayment.id,
      studentId: existingPayment.studentId,
      month: existingPayment.month,
      amount: existingPayment.amount,
      isPaid: isPaid,
    );
    context.read<PaymentsCubit>().updatePayment(updated);
  } else {
    final newPayment = PaymentEntity(
      id: const Uuid().v4(),
      studentId: studentId,
      month: selectedMonth,
      amount: 500,
      isPaid: isPaid,
    );
    context.read<PaymentsCubit>().addPayment(newPayment);
  }
}
