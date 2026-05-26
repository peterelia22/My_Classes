import 'package:flutter/material.dart';
import 'package:my_classes/features/splash/presentation/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
