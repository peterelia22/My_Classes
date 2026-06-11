import 'package:flutter/material.dart';
import 'widgets/payments_view/payments_view_body_bloc_consumer.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PaymentsViewBodyBlocConsumer(),
    );
  }
}
