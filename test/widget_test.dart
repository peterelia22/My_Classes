import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';

import 'package:my_classes/main.dart';

void main() {
  testWidgets('App theme uses configured colors and text styles',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyClasses());

    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    final theme = materialApp.theme!;

    expect(theme.colorScheme.primary, AppColors.primaryColor);
    expect(theme.colorScheme.secondary, AppColors.secondaryColor);
    expect(theme.colorScheme.error, AppColors.errorColor);
    expect(
      theme.textTheme.displayLarge?.fontFamily,
      AppTextStyles.displayLarge.fontFamily,
    );
    expect(
      theme.textTheme.displayLarge?.fontSize,
      AppTextStyles.displayLarge.fontSize,
    );
    expect(
      theme.textTheme.bodyLarge?.fontSize,
      AppTextStyles.bodyLarge.fontSize,
    );
  });
}
