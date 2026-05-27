import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/services/get_it_service.dart';
import 'package:my_classes/features/auth/login/domain/repos/auth_repo.dart';
import 'package:my_classes/features/auth/login/presentation/cubits/login_cubit.dart';

import 'widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(body: LoginViewBodyBlocConsumer()),
    );
  }
}
