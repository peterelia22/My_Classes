import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_classes/core/services/supbase_service.dart';
import 'package:my_classes/features/splash/presentation/splash_view.dart';
import 'core/helpers/on_generate_routes.dart';
import 'core/theme/app_theme.dart';

void main() async {
  try {
    await SupabaseService.init();
    log('Supabase initialized');
  } on Exception catch (e) {
    log('Error initializing Supabase: ${e.toString()}');
    // TODO
  }
  runApp(const MyClasses());
}

class MyClasses extends StatelessWidget {
  const MyClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}
