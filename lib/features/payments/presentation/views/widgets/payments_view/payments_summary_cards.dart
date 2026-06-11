import 'package:flutter/material.dart';
import 'payment_summary_card.dart';

class PaymentsSummaryCards extends StatelessWidget {
  final int paidCount;
  final int notPaidCount;

  const PaymentsSummaryCards({
    super.key,
    required this.paidCount,
    required this.notPaidCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PaymentSummaryCard(
            title: 'دفعوا',
            count: paidCount,
            color: Colors.green,
            icon: Icons.check_circle_outline,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: PaymentSummaryCard(
            title: 'لم يدفعوا',
            count: notPaidCount,
            color: Colors.redAccent,
            icon: Icons.cancel_outlined,
          ),
        ),
      ],
    );
  }
}
