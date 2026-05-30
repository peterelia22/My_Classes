import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/services/shared_preferences_service.dart';
import 'package:my_classes/core/services/supbase_service.dart';
import 'package:my_classes/core/services/custom_bloc_observer.dart';
import 'package:my_classes/features/splash/presentation/splash_view.dart';
import 'package:my_classes/generated/l10n.dart';
import 'core/helpers/on_generate_routes.dart';
import 'core/services/get_it_service.dart';
import 'core/theme/app_colors.dart';

void main() async {
  try {
    await SupabaseService.init();
    log('Supabase initialized');
  } on Exception catch (e) {
    log('Error initializing Supabase: ${e.toString()}');
    // TODO
  }
  setupGetit();
  Bloc.observer = CustomBlocObserver();
  await SharedPreferencesSingleton.init();
  runApp(const MyClasses());
}

class MyClasses extends StatelessWidget {
  const MyClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        scaffoldBackgroundColor: Colors.white,
      ),
      // themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}
