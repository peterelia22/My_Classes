import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_classes/features/auth/login/presentation/cubits/login_state.dart';

import '../../domain/repos/auth_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepo.signInWithEmail(email, password);

    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
