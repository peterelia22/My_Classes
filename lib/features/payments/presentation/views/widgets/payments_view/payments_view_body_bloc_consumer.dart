import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/helpers/build_snack_bar.dart';
import 'package:my_classes/core/widgets/custom_progress_hud.dart';
import 'package:my_classes/features/payments/presentation/cubits/payments_cubit.dart';
import 'payments_view_body.dart';

class PaymentsViewBodyBlocConsumer extends StatelessWidget {
  const PaymentsViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentsCubit, PaymentsState>(
      listener: (context, state) {
        if (state is PaymentActionFailure) {
          buildSnackBar(
            context: context,
            title: 'خطأ',
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        } else if (state is PaymentsFailure) {
          buildSnackBar(
            context: context,
            title: 'خطأ',
            message: state.errorMessage,
            contentType: ContentType.failure,
          );
        } else if (state is PaymentActionSuccess) {
          buildSnackBar(
            context: context,
            title: 'نجح',
            message: 'تم تحديث حالة الدفع بنجاح',
            contentType: ContentType.success,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is PaymentsLoading,
          child: const PaymentsViewBody(),
        );
      },
    );
  }
}
