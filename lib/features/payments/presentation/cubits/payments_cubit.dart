import 'package:bloc/bloc.dart';
import '../../domain/entities/payment_entity.dart';
import '../../domain/repos/payment_repo.dart';
part 'payments_state.dart';

class PaymentsCubit extends Cubit<PaymentsState> {
  PaymentsCubit(this.paymentRepo) : super(PaymentsInitial());
  final PaymentRepo paymentRepo;

  List<PaymentEntity> currentPayments = [];

  Future<void> getAllPayments() async {
    emit(PaymentsLoading());
    final result = await paymentRepo.getAllPayments();
    result.fold((f) => emit(PaymentsFailure(errorMessage: f.message)), (
      payments,
    ) {
      currentPayments = payments;
      emit(PaymentsSuccess(payments: payments));
    });
  }

  Future<void> getPaymentsByStudent(String studentId) async {
    emit(PaymentsLoading());
    final result = await paymentRepo.getPaymentsByStudent(studentId);
    result.fold((f) => emit(PaymentsFailure(errorMessage: f.message)), (
      payments,
    ) {
      currentPayments = payments;
      emit(PaymentsSuccess(payments: payments));
    });
  }

  Future<void> addPayment(PaymentEntity payment) async {
    emit(PaymentsLoading());
    final result = await paymentRepo.addPayment(payment);
    result.fold((f) => emit(PaymentActionFailure(errorMessage: f.message)), (
      _,
    ) async {
      await getAllPayments();
      emit(PaymentActionSuccess());
    });
  }

  Future<void> updatePayment(PaymentEntity payment) async {
    emit(PaymentsLoading());
    final result = await paymentRepo.updatePayment(payment);
    result.fold((f) => emit(PaymentActionFailure(errorMessage: f.message)), (
      _,
    ) async {
      await getAllPayments();
      emit(PaymentActionSuccess());
    });
  }

  Future<void> deletePayment(String id) async {
    emit(PaymentsLoading());
    final result = await paymentRepo.deletePayment(id);
    result.fold((f) => emit(PaymentActionFailure(errorMessage: f.message)), (
      _,
    ) async {
      await getAllPayments();
      emit(PaymentDeleteSuccess());
    });
  }
}
