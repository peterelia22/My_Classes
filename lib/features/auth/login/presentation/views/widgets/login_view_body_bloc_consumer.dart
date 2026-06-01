import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/services/shared_preferences_service.dart';
import 'package:my_classes/core/widgets/custom_progress_hud.dart';
import 'package:my_classes/features/home/presentation/views/app_shell.dart';

import '../../../../../../core/helpers/build_snack_bar.dart';
import '../../cubits/login_cubit.dart';
import '../../cubits/login_state.dart';
import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          buildSnackBar(
            context: context,
            title: 'تم تسجيل الدخول بنجاح',
            message: 'مرحباً بك في التطبيق',
            contentType: ContentType.success,
          );
          SharedPreferencesSingleton.setBool('isLoggedIn', true);
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppShell.routeName, (route) => false);
        }
        if (state is LoginFailure) {
          buildSnackBar(
            context: context,
            title: 'فشل في تسجيل الدخول',
            message: 'يرجى التحقق من بيانات الدخول',
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is LoginLoading,
          child: LoginViewBody(),
        );
      },
    );
  }
}
