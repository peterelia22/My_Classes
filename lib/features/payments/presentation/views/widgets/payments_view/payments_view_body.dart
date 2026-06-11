import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/constants/app_constants.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:uuid/uuid.dart';

import 'package:my_classes/features/groups/presentation/cubits/groups_cubit.dart';
import 'package:my_classes/features/students/presentation/cubits/students_cubit.dart';
import 'package:my_classes/features/payments/presentation/cubits/payments_cubit.dart';
import 'package:my_classes/features/payments/domain/entities/payment_entity.dart';

import 'payment_item_card.dart';
import 'payments_filters_row.dart';
import 'payments_summary_cards.dart';
import 'student_payment_data.dart';

class PaymentsViewBody extends StatefulWidget {
  const PaymentsViewBody({super.key});

  @override
  State<PaymentsViewBody> createState() => _PaymentsViewBodyState();
}

class _PaymentsViewBodyState extends State<PaymentsViewBody> {
  late String selectedMonth;
  String? selectedGroupId;

  @override
  void initState() {
    super.initState();
    selectedMonth = AppConstants.months[DateTime.now().month - 1];
    context.read<PaymentsCubit>().getAllPayments();
  }

  void _handleTogglePayment(
    bool isPaid,
    String studentId,
    PaymentEntity? existingPayment,
  ) {
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

  @override
  Widget build(BuildContext context) {
    final groups = context.watch<GroupsCubit>().currentGroups;
    final students = context.watch<StudentsCubit>().currentStudents;
    final payments = context.watch<PaymentsCubit>().currentPayments;

    final filteredStudents = students.where((s) {
      if (selectedGroupId != null && s.groupId != selectedGroupId) return false;
      return true;
    }).toList();

    int paidCount = 0;
    int notPaidCount = 0;

    final studentPaymentData = filteredStudents.map((student) {
      final existingPayment = payments
          .where((p) => p.studentId == student.id && p.month == selectedMonth)
          .firstOrNull;
      final group = groups.where((g) => g.id == student.groupId).firstOrNull;
      final isPaid = existingPayment?.isPaid ?? false;

      if (isPaid) {
        paidCount++;
      } else {
        notPaidCount++;
      }

      return StudentPaymentData(
        student: student,
        group: group,
        existingPayment: existingPayment,
        isPaid: isPaid,
      );
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'المدفوعات',
              style: AppTextStyles.headlineSmall.copyWith(
                color: AppColors.textPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            PaymentsFiltersRow(
              selectedMonth: selectedMonth,
              selectedGroupId: selectedGroupId,
              groups: groups,
              onMonthChanged: (val) => setState(() => selectedMonth = val),
              onGroupChanged: (val) => setState(() => selectedGroupId = val),
            ),
            const SizedBox(height: 24),
            Text(
              'ملخص',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.textPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            PaymentsSummaryCards(
              paidCount: paidCount,
              notPaidCount: notPaidCount,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: studentPaymentData.isEmpty
                  ? Center(
                      child: Text(
                        'لا يوجد طلاب مطابقين للبحث',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondaryColor,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: studentPaymentData.length,
                      itemBuilder: (context, index) {
                        final data = studentPaymentData[index];
                        return PaymentItemCard(
                          student: data.student,
                          group: data.group,
                          isPaid: data.isPaid,
                          onTogglePayment: (newIsPaid) {
                            _handleTogglePayment(
                              newIsPaid,
                              data.student.id,
                              data.existingPayment,
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
