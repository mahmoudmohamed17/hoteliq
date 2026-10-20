import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppTypography {
  static const String fontFamily = 'Inter';

  static TextTheme build() {
    TextStyle style(
      double size,
      FontWeight w, {
      double? height,
      double? letterSpacing,
    }) => TextStyle(
      fontFamily: fontFamily,
      fontSize: size.sp,
      fontWeight: w,
      height: height,
      letterSpacing: letterSpacing,
    );

    return TextTheme(
      // Display: large hero numbers and display text
      displayLarge: style(57, FontWeight.w400, height: 1.12, letterSpacing: -0.25),
      displayMedium: style(45, FontWeight.w400, height: 1.16),
      displaySmall: style(36, FontWeight.w400, height: 1.22),

      // Headline: section headers and primary page titles
      headlineLarge: style(32, FontWeight.w400, height: 1.25),
      headlineMedium: style(28, FontWeight.w400, height: 1.29),
      headlineSmall: style(24, FontWeight.w400, height: 1.33),

      // Title: card headers, dialog titles, list item titles
      titleLarge: style(22, FontWeight.w400, height: 1.27),
      titleMedium: style(16, FontWeight.w500, height: 1.5, letterSpacing: 0.15),
      titleSmall: style(14, FontWeight.w500, height: 1.43, letterSpacing: 0.1),

      // Body: main copy, descriptions, form field text
      bodyLarge: style(16, FontWeight.w400, height: 1.5, letterSpacing: 0.5),
      bodyMedium: style(14, FontWeight.w400, height: 1.43, letterSpacing: 0.25),
      bodySmall: style(12, FontWeight.w400, height: 1.33, letterSpacing: 0.4),

      // Label: buttons, tags, chips, captions
      labelLarge: style(14, FontWeight.w500, height: 1.43, letterSpacing: 0.1),
      labelMedium: style(12, FontWeight.w500, height: 1.33, letterSpacing: 0.5),
      labelSmall: style(11, FontWeight.w500, height: 1.45, letterSpacing: 0.5),
    );
  }
}
