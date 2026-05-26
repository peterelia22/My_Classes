import 'package:flutter/material.dart';
import 'package:my_classes/features/splash/presentation/splash_view.dart';

import 'core/helpers/on_generate_routes.dart';

void main() {
  runApp(const MyClasses());
}

class MyClasses extends StatelessWidget {
  const MyClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}
