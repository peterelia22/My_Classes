import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.textLightColor,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.textLightColor,
      surface: AppColors.surfaceColor,
      onSurface: AppColors.textPrimaryColor,
      error: AppColors.errorColor,
      onError: AppColors.textLightColor,
      outline: AppColors.borderColor,
      shadow: AppColors.shadowColor,
    );

    final baseTextTheme = TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: baseTextTheme.apply(
        bodyColor: AppColors.textPrimaryColor,
        displayColor: AppColors.textPrimaryColor,
      ),
      dividerColor: AppColors.dividerColor,
      useMaterial3: true,
    );
  }
}
