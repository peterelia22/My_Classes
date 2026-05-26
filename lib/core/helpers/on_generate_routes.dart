import 'package:flutter/material.dart';
import 'package:my_classes/features/home/presentation/views/app_shell.dart';
import 'package:my_classes/features/splash/presentation/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case AppShell.routeName:
      return MaterialPageRoute(builder: (context) => const AppShell());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
