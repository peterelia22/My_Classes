part of 'payments_cubit.dart';

sealed class PaymentsState {}

final class PaymentsInitial extends PaymentsState {}

final class PaymentsLoading extends PaymentsState {}

final class PaymentsSuccess extends PaymentsState {
  final List<PaymentEntity> payments;
  PaymentsSuccess({required this.payments});
}

final class PaymentsFailure extends PaymentsState {
  final String errorMessage;
  PaymentsFailure({required this.errorMessage});
}

final class PaymentActionSuccess extends PaymentsState {}

final class PaymentDeleteSuccess extends PaymentsState {}

final class PaymentActionFailure extends PaymentsState {
  final String errorMessage;
  PaymentActionFailure({required this.errorMessage});
}
