import 'package:flutter/material.dart';

abstract final class AppTypography {
  static const String fontFamily = 'Inter';

  /// Arabic letterforms read smaller, so scale up slightly.
  static TextTheme build() {
    TextStyle heading(double size, FontWeight w) => TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: w,
      height: 1.5,
      letterSpacing: 0,
    );

    TextStyle body(double size, FontWeight w, {double? h}) => TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: w,
      height: h,
      letterSpacing: 0,
    );

    return TextTheme(
      displaySmall: heading(36, FontWeight.w600),
      headlineLarge: heading(30, FontWeight.w600),
      headlineMedium: heading(26, FontWeight.w600),
      headlineSmall: heading(22, FontWeight.w600),
      titleLarge: heading(20, FontWeight.w600),
      titleMedium: heading(16, FontWeight.w500),
      titleSmall: heading(14, FontWeight.w500),
      bodyLarge: body(16, FontWeight.w400),
      bodyMedium: body(14, FontWeight.w400),
      bodySmall: body(12, FontWeight.w400),
      labelLarge: body(16, FontWeight.w600, h: 1.4),
      labelMedium: body(14, FontWeight.w500, h: 1.4),
      labelSmall: body(12, FontWeight.w500, h: 1.4),
    );
  }
}
