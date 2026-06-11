import 'package:flutter/material.dart';
import 'package:my_classes/features/auth/login/presentation/views/login_view.dart';
import 'package:my_classes/features/home/presentation/views/app_shell.dart';
import 'package:my_classes/features/splash/presentation/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/features/groups/presentation/cubits/groups_cubit.dart';
import 'package:my_classes/features/groups/presentation/views/group_details_view.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';
import 'package:my_classes/features/students/domain/entities/student_entity.dart';
import 'package:my_classes/features/students/presentation/cubits/students_cubit.dart';
import 'package:my_classes/features/students/presentation/views/student_details_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case AppShell.routeName:
      return MaterialPageRoute(builder: (context) => const AppShell());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case GroupDetailsView.routeName:
      final args = settings.arguments as Map<String, dynamic>;
      final group = args['group'] as GroupEntity;
      final cubit = args['cubit'] as GroupsCubit;
      final studentsCubit = args['studentsCubit'] as StudentsCubit;
      return MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: cubit),
            BlocProvider.value(value: studentsCubit),
          ],
          child: GroupDetailsView(group: group),
        ),
      );
    case StudentDetailsView.routeName:
      final args = settings.arguments as Map<String, dynamic>;
      final student = args['student'] as StudentEntity;
      final studentsCubit = args['studentsCubit'] as StudentsCubit;
      final groupsCubit = args['groupsCubit'] as GroupsCubit;
      return MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: studentsCubit),
            BlocProvider.value(value: groupsCubit),
          ],
          child: StudentDetailsView(student: student),
        ),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
