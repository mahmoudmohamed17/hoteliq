import 'package:flutter/material.dart';

/// Raw palette + Material 3 [ColorScheme]s for Hoteliq.
///
/// Source: Nam Design "Color Guide" (5 swatches) + the Home / Detail /
/// Schedule screens. Everything else (error, status, dark mode) is derived
/// from those swatches because the design file does not define it.
///
/// Rule of thumb: widgets should read colors from `Theme.of(context)`
/// (`colorScheme`) or `context.appColors` — never from this class directly.
/// The raw constants exist so the theme layer has one source of truth.
abstract final class AppColors {
  // ── Brand (from the design's Color Guide) ────────────────────────────────
  static const Color primary = Color(0xFF4C4DDC); // 01 · Indigo
  static const Color primaryTint = Color(0xFFE4E4FA); // 02 · Soft Lavender
  static const Color ink = Color(0xFF101010); // 03 · Near Black
  static const Color primarySoft = Color(0xFFC8C8F4); // 04 · Periwinkle
  static const Color disabledFill = Color(0xFFE1E1E1); // 05 · Light Grey

  // ── Light neutrals (read from the screens) ───────────────────────────────
  static const Color canvas = Color(0xFFFFFFFF); // screen background
  static const Color card = Color(0xFFFFFFFF);
  static const Color chipFill = Color(0xFFF7F7FC); // amenity tiles, idle chips
  static const Color calendarFill = Color(0xFFFAFAFA); // calendar card
  static const Color border = Color(0xFFE1E1E1);
  static const Color onSurfaceVariant = Color(0xFF6B6B76); // secondary text
  static const Color outline = Color(0xFF8A8A96);

  // ── Accents seen in the UI ───────────────────────────────────────────────
  static const Color star = Color(0xFFFFC107); // rating star
  static const Color heart = Color(0xFFE53935); // favorite heart

  // ── Dark neutrals (derived, not in the design) ───────────────────────────
  static const Color darkBg = Color(0xFF101010);
  static const Color darkSurface = Color(0xFF1A1A22);
  static const Color darkOverlay = Color(0xFF24242E);
  static const Color darkBorder = Color(0xFF2E2E3A);

  /// Modal scrim: rgba(16, 16, 16, 0.45)
  static const Color scrim = Color(0x73101010);

  // ── Material 3 color schemes ─────────────────────────────────────────────
  static const ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: primaryTint,
    onPrimaryContainer: primary, // tonal button: indigo text on lavender
    secondary: Color(0xFF5E5F9E),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: primarySoft,
    onSecondaryContainer: Color(0xFF1B1C5E),
    tertiary: Color(0xFFB45309), // amber, used for warm highlights
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFEF3C7),
    onTertiaryContainer: Color(0xFF78350F),
    error: Color(0xFFD32F2F),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFEE2E2),
    onErrorContainer: Color(0xFF7F1D1D),
    surface: canvas,
    onSurface: ink,
    onSurfaceVariant: onSurfaceVariant,
    surfaceDim: Color(0xFFEDEDF2),
    surfaceBright: canvas,
    surfaceContainerLowest: card,
    surfaceContainerLow: chipFill,
    surfaceContainer: calendarFill,
    surfaceContainerHigh: Color(0xFFF1F1F6),
    surfaceContainerHighest: disabledFill,
    outline: outline,
    outlineVariant: border,
    shadow: Color(0xFF000000),
    scrim: Color(0xFF101010),
    inverseSurface: Color(0xFF26262E),
    onInverseSurface: Color(0xFFF4F4F8),
    inversePrimary: Color(0xFF9B9CF2),
    surfaceTint: Colors.transparent, // no M3 tint overlay on elevation
  );

  static const ColorScheme darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF9B9CF2),
    onPrimary: Color(0xFF12125E),
    primaryContainer: Color(0xFF34358F),
    onPrimaryContainer: primaryTint,
    secondary: Color(0xFFB9BAE8),
    onSecondary: Color(0xFF1B1C5E),
    secondaryContainer: Color(0xFF42437A),
    onSecondaryContainer: primarySoft,
    tertiary: Color(0xFFFCD34D),
    onTertiary: Color(0xFF3A2A08),
    tertiaryContainer: Color(0xFF5C3A08),
    onTertiaryContainer: Color(0xFFFEF3C7),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: darkBg,
    onSurface: Color(0xFFF2F2F7),
    onSurfaceVariant: Color(0xFFA9A9B8),
    surfaceDim: Color(0xFF0A0A0A),
    surfaceBright: Color(0xFF2A2A34),
    surfaceContainerLowest: Color(0xFF0A0A0A),
    surfaceContainerLow: Color(0xFF16161D),
    surfaceContainer: darkSurface,
    surfaceContainerHigh: Color(0xFF20202A),
    surfaceContainerHighest: darkOverlay,
    outline: Color(0xFF7E7E8E),
    outlineVariant: darkBorder,
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFF2F2F7),
    onInverseSurface: darkBg,
    inversePrimary: primary,
    surfaceTint: Colors.transparent,
  );
}

/// Status colors (success / warning / info / danger).
///
/// * [main]        – icons, fills, borders (not guaranteed AA as small text).
/// * [text]        – AA-safe color for text on the page background.
/// * [container]   – soft badge / banner / snackbar background.
/// * [onContainer] – text on [container].
@immutable
class AppStatusColors {
  const AppStatusColors({
    required this.main,
    required this.text,
    required this.container,
    required this.onContainer,
  });

  final Color main;
  final Color text;
  final Color container;
  final Color onContainer;
}

/// Colors for a booking's lifecycle. Map your booking enum to these:
/// `confirmed → success`, `pending → warning`, `upcoming → info`,
/// `cancelled → danger`.
///
/// App-specific tokens that Material's [ColorScheme] has no slot for.
/// Access with `context.appColors`.
@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.success,
    required this.warning,
    required this.info,
    required this.danger,
    required this.rating,
    required this.favorite,
    required this.favoriteSurface,
    required this.amenityFill,
    required this.calendarFill,
    required this.overlaySurface,
  });

  final AppStatusColors success;
  final AppStatusColors warning;
  final AppStatusColors info;
  final AppStatusColors danger;

  /// Rating star.
  final Color rating;

  /// Filled favorite heart.
  final Color favorite;

  /// White circle behind the heart on hotel photos.
  final Color favoriteSurface;

  /// Amenity tiles ("Free Wifi", "Free Breakfast", rating pill).
  final Color amenityFill;

  /// Calendar card background.
  final Color calendarFill;

  /// Dialogs and bottom sheets.
  final Color overlaySurface;

  static const AppSemanticColors light = AppSemanticColors(
    success: AppStatusColors(
      main: Color(0xFF15803D),
      text: Color(0xFF15803D),
      container: Color(0xFFDCFCE7),
      onContainer: Color(0xFF14532D),
    ),
    warning: AppStatusColors(
      main: Color(0xFFD97706),
      text: Color(0xFF92400E),
      container: Color(0xFFFEF3C7),
      onContainer: Color(0xFF78350F),
    ),
    info: AppStatusColors(
      main: AppColors.primary,
      text: AppColors.primary,
      container: AppColors.primaryTint,
      onContainer: Color(0xFF1B1C5E),
    ),
    danger: AppStatusColors(
      main: Color(0xFFDC2626),
      text: Color(0xFFB91C1C),
      container: Color(0xFFFEE2E2),
      onContainer: Color(0xFF7F1D1D),
    ),
    rating: AppColors.star,
    favorite: AppColors.heart,
    favoriteSurface: Color(0xFFFFFFFF),
    amenityFill: AppColors.chipFill,
    calendarFill: AppColors.calendarFill,
    overlaySurface: AppColors.card,
  );

  static const AppSemanticColors dark = AppSemanticColors(
    success: AppStatusColors(
      main: Color(0xFF4ADE80),
      text: Color(0xFF4ADE80),
      container: Color(0xFF0F3320),
      onContainer: Color(0xFFBBF7D0),
    ),
    warning: AppStatusColors(
      main: Color(0xFFFBBF24),
      text: Color(0xFFFCD34D),
      container: Color(0xFF3A2A08),
      onContainer: Color(0xFFFDE68A),
    ),
    info: AppStatusColors(
      main: Color(0xFF9B9CF2),
      text: Color(0xFFB4B5F6),
      container: Color(0xFF2A2B6E),
      onContainer: AppColors.primaryTint,
    ),
    danger: AppStatusColors(
      main: Color(0xFFF87171),
      text: Color(0xFFFCA5A5),
      container: Color(0xFF3F1414),
      onContainer: Color(0xFFFECACA),
    ),
    rating: AppColors.star,
    favorite: Color(0xFFFF6B66),
    favoriteSurface: Color(0xFF24242E),
    amenityFill: Color(0xFF16161D),
    calendarFill: AppColors.darkSurface,
    overlaySurface: AppColors.darkOverlay,
  );

  @override
  AppSemanticColors copyWith({
    AppStatusColors? success,
    AppStatusColors? warning,
    AppStatusColors? info,
    AppStatusColors? danger,
    Color? rating,
    Color? favorite,
    Color? favoriteSurface,
    Color? amenityFill,
    Color? calendarFill,
    Color? overlaySurface,
  }) {
    return AppSemanticColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      danger: danger ?? this.danger,
      rating: rating ?? this.rating,
      favorite: favorite ?? this.favorite,
      favoriteSurface: favoriteSurface ?? this.favoriteSurface,
      amenityFill: amenityFill ?? this.amenityFill,
      calendarFill: calendarFill ?? this.calendarFill,
      overlaySurface: overlaySurface ?? this.overlaySurface,
    );
  }

  /// Theme switches snap at the midpoint; token groups are not interpolated.
  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return t < 0.5 ? this : other;
  }
}

extension AppColorsContext on BuildContext {
  /// Semantic colors for the current theme.
  AppSemanticColors get appColors => Theme.of(this).extension<AppSemanticColors>() ?? AppSemanticColors.light;
}
