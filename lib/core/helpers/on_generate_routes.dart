import 'package:flutter/material.dart';
import 'package:my_classes/features/auth/login/presentation/views/login_view.dart';
import 'package:my_classes/features/home/presentation/views/app_shell.dart';
import 'package:my_classes/features/splash/presentation/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/features/groups/presentation/cubits/groups_cubit.dart';
import 'package:my_classes/features/groups/presentation/views/group_details_view.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

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
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: cubit,
          child: GroupDetailsView(group: group),
        ),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
