import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFF1976D2);
  static const Color lightPrimaryColor = Color(0xFF42A5F5);
  static const Color darkPrimaryColor = Color(0xFF1565C0);

  // Secondary Colors
  static const Color secondaryColor = Color(0xFF26C6DA);
  static const Color lightSecondaryColor = Color(0xFF80DEEA);
  static const Color darkSecondaryColor = Color(0xFF00838F);

  // Neutral Colors
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFD32F2F);
  static const Color successColor = Color(0xFF388E3C);
  static const Color warningColor = Color(0xFFF57C00);
  static const Color infoColor = Color(0xFF1976D2);

  // Text Colors
  static const Color textPrimaryColor = Color(0xFF212121);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color textHintColor = Color(0xFFBDBDBD);
  static const Color textLightColor = Color(0xFFF5F5F5);

  // Border & Divider Colors
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color dividerColor = Color(0xFFEEEEEE);

  // Shadow Colors
  static const Color shadowColor = Color(0x1A000000);

  // Status Colors
  static const Color presentColor = Color(0xFF4CAF50);
  static const Color absentColor = Color(0xFFF44336);
  static const Color paidColor = Color(0xFF4CAF50);
  static const Color unpaidColor = Color(0xFFFF9800);

  // Attendance specific
  static const Color checkInColor = Color(0xFF00BCD4);
  static const Color checkOutColor = Color(0xFF9C27B0);
  // ─── Session / Calendar Colors ───────────────────────────────────────────

  static const List<Color> sessionBgColors = [
    Color(0xFFEEEDFE),
    Color(0xFFE1F5EE),
    Color(0xFFFAECE7),
    Color(0xFFFBEAF0),
    Color(0xFFE6F1FB),
    Color(0xFFEAF3DE),
    Color(0xFFFAEEDA),
  ];

  static const List<Color> sessionTextColors = [
    Color(0xFF3C3489),
    Color(0xFF085041),
    Color(0xFF712B13),
    Color(0xFF72243E),
    Color(0xFF0C447C),
    Color(0xFF27500A),
    Color(0xFF633806),
  ];

  static const List<Color> sessionSubTextColors = [
    Color(0xFF534AB7),
    Color(0xFF0F6E56),
    Color(0xFF993C1D),
    Color(0xFF993556),
    Color(0xFF185FA5),
    Color(0xFF3B6D11),
    Color(0xFF854F0B),
  ];
}
