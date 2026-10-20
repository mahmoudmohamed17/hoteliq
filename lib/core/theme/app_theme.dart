import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_typography.dart';

/// 4 / 8 pt spacing scale.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;

  /// Horizontal screen margin (matches the design's 20dp page inset).
  static const double screenMargin = 20;
  static const double gutter = 16;

  /// Symmetric, so identical in RTL and LTR.
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: screenMargin);
}

/// Corner radii (read from the design: photos/cards are very round).
abstract final class AppRadius {
  static const double sm = 6;
  static const double base = 8;
  static const double md = 12; // amenity tiles, thumbnails
  static const double lg = 16; // buttons, fields, chips, calendar
  static const double card = 20; // hotel cards, schedule cards
  static const double photo = 24; // hero photo on detail screen
  static const double dialog = 24;
  static const double xl = 28; // sheets
  static const double pill = 9999;

  static const BorderRadius mdAll = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgAll = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius cardAll = BorderRadius.all(Radius.circular(card));
  static const BorderRadius photoAll = BorderRadius.all(Radius.circular(photo));
  static const BorderRadius dialogAll = BorderRadius.all(Radius.circular(dialog));
  static const BorderRadius pillAll = BorderRadius.all(Radius.circular(pill));
  static const BorderRadius sheetTop = BorderRadius.vertical(
    top: Radius.circular(xl),
  );
}

/// Very soft, neutral ambient shadows (the design's cards float on white with
/// a barely-there blur). Dark mode uses surface tiers instead, so these
/// return an empty list there.
abstract final class AppShadows {
  /// Hotel / schedule cards.
  static List<BoxShadow> level1(BuildContext context) => _isDark(context)
      ? const []
      : const [
          BoxShadow(
            color: Color(0x0F101010), // 6 %
            blurRadius: 24,
            spreadRadius: -4,
            offset: Offset(0, 6),
          ),
        ];

  /// Floating elements (favorite button on photos, sticky booking bar).
  static List<BoxShadow> level2(BuildContext context) => _isDark(context)
      ? const []
      : const [
          BoxShadow(
            color: Color(0x1A101010), // 10 %
            blurRadius: 20,
            spreadRadius: -4,
            offset: Offset(0, 4),
          ),
        ];

  /// Sheets and primary call-to-action glow.
  static List<BoxShadow> level3(BuildContext context) => _isDark(context)
      ? const []
      : const [
          BoxShadow(
            color: Color(0x294C4DDC), // 16 % indigo
            blurRadius: 32,
            spreadRadius: -4,
            offset: Offset(0, 8),
          ),
        ];

  static bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
}

/// Motion tokens. Respect `MediaQuery.disableAnimationsOf(context)`
/// by swapping these durations for [Duration.zero].
abstract final class AppMotion {
  static const Duration fast = Duration(milliseconds: 120); // press feedback
  static const Duration base = Duration(milliseconds: 200); // chips, favorite toggle
  static const Duration slow = Duration(milliseconds: 320); // sheets, pages

  static const Curve standard = Curves.easeInOutCubic;
  static const Curve enter = Curves.easeOutCubic;
  static const Curve exit = Curves.easeInCubic;
}

/// Entry point:
abstract final class AppTheme {
  static ThemeData get light => _build(AppColors.lightScheme, AppSemanticColors.light);

  static ThemeData get dark => _build(AppColors.darkScheme, AppSemanticColors.dark);

  static const double _minTarget = 48;
  static const double _controlHeight = 56; // design buttons are tall

  static ThemeData _build(ColorScheme scheme, AppSemanticColors semantic) {
    final bool isDark = scheme.brightness == Brightness.dark;

    final TextTheme text = AppTypography.build().apply(
      bodyColor: scheme.onSurface,
      displayColor: scheme.onSurface,
    );

    OutlineInputBorder fieldBorder(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: AppRadius.lgAll,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    const RoundedRectangleBorder buttonShape = RoundedRectangleBorder(
      borderRadius: AppRadius.lgAll,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.surface,
      textTheme: text,
      primaryTextTheme: text,
      extensions: <ThemeExtension<dynamic>>[semantic],
      materialTapTargetSize: MaterialTapTargetSize.padded,
      visualDensity: VisualDensity.standard,
      splashFactory: InkRipple.splashFactory,
      dividerColor: scheme.outlineVariant,
      iconTheme: IconThemeData(color: scheme.onSurface, size: 24.sp),

      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),

      // ── App bar ──────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: text.titleMedium,
        iconTheme: IconThemeData(color: scheme.onSurface, size: 24.sp),
        systemOverlayStyle: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),

      // ── Cards (hotel / schedule cards: white, 20dp, hairline border) ─────
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLowest,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.cardAll,
          side: BorderSide(color: isDark ? scheme.outlineVariant : Colors.transparent),
        ),
      ),

      // ── Buttons (16dp radius, 56dp tall — matches the design's 4 states) ─
      // primary  → FilledButton            (indigo fill, white label)
      // tonal    → FilledButton.tonal      (lavender fill, indigo label)
      // outlined → OutlinedButton          (hairline border, ink label)
      // disabled → any, with onPressed: null (light-grey fill)
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(88, _controlHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: buttonShape,
          textStyle: text.labelLarge,
          iconSize: 24.sp,
          elevation: 0,
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.surfaceContainerHighest,
          disabledForegroundColor: scheme.onSurface.withValues(alpha: 0.38),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(88, _controlHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: buttonShape,
          textStyle: text.titleSmall,
          iconSize: 24.sp,
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.surfaceContainerHighest,
          disabledForegroundColor: scheme.onSurface.withValues(alpha: 0.38),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(88, _controlHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: buttonShape,
          textStyle: text.titleSmall,
          iconSize: 24.sp,
          foregroundColor: scheme.onSurface,
          disabledForegroundColor: scheme.onSurface.withValues(alpha: 0.38),
          side: BorderSide(color: scheme.outlineVariant),
          shadowColor: Colors.transparent,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(64, _minTarget),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: buttonShape,
          textStyle: text.labelMedium, // "See all", "Read More…"
          iconSize: 24.sp,
          foregroundColor: scheme.primary,
          shadowColor: Colors.transparent,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(_minTarget, _minTarget),
          foregroundColor: scheme.onSurface,
        ),
      ),

      // ── Text fields ──────────────────────────────────────────────────────
      // The enabled border uses `outline` (>= 3:1), not the pale card border,
      // so fields stay visible (WCAG 1.4.11).
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerLow,
        isDense: false,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        constraints: const BoxConstraints(minHeight: _controlHeight),
        labelStyle: text.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
        floatingLabelStyle: text.bodyMedium?.copyWith(color: scheme.primary),
        hintStyle: text.bodyMedium?.copyWith(color: scheme.onSurface.withValues(alpha: 0.50)),
        helperStyle: text.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
        errorStyle: text.bodySmall?.copyWith(color: scheme.error),
        errorMaxLines: 3,
        prefixIconColor: scheme.onSurfaceVariant,
        suffixIconColor: scheme.onSurfaceVariant,
        border: fieldBorder(scheme.outlineVariant),
        enabledBorder: fieldBorder(scheme.outlineVariant),
        focusedBorder: fieldBorder(scheme.primary, width: 2),
        errorBorder: fieldBorder(scheme.error),
        focusedErrorBorder: fieldBorder(scheme.error, width: 2),
        disabledBorder: fieldBorder(scheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: scheme.primary,
        selectionColor: scheme.primary.withAlpha(77), // ~30 %
        selectionHandleColor: scheme.primary,
      ),

      // ── Search bar ───────────────────────────────────────────────────────
      searchBarTheme: SearchBarThemeData(
        elevation: const WidgetStatePropertyAll<double>(0),
        backgroundColor: WidgetStatePropertyAll<Color>(scheme.surfaceContainerLow),
        surfaceTintColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
        constraints: const BoxConstraints(minHeight: _controlHeight),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 16),
        ),
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: AppRadius.lgAll,
            side: BorderSide(color: scheme.outlineVariant),
          ),
        ),
        textStyle: WidgetStatePropertyAll<TextStyle?>(text.bodyLarge),
        hintStyle: WidgetStatePropertyAll<TextStyle?>(
          text.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
        ),
      ),

      // ── Chips (property-type selector: Hotel / Homestay / Apartment…) ────
      // Selected = solid indigo with white label; idle = soft tinted fill.
      chipTheme: ChipThemeData(
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.lgAll),
        side: BorderSide.none,
        backgroundColor: semantic.amenityFill,
        selectedColor: scheme.primary,
        disabledColor: scheme.surfaceContainerHighest,
        showCheckmark: false,
        checkmarkColor: scheme.onPrimary,
        iconTheme: IconThemeData(size: 20, color: scheme.onSurface),
        labelStyle: WidgetStateTextStyle.resolveWith(
          (Set<WidgetState> states) => text.labelMedium!.copyWith(
            color: states.contains(WidgetState.selected) ? scheme.onPrimary : scheme.onSurfaceVariant,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        labelPadding: const EdgeInsets.symmetric(horizontal: 6),
        elevation: 0,
        pressElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),

      // ── Bottom sheet ─────────────────────────────────────────────────────
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: semantic.overlaySurface,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: semantic.overlaySurface,
        modalBarrierColor: AppColors.scrim,
        elevation: 0,
        modalElevation: 0,
        showDragHandle: true,
        dragHandleSize: const Size(48, 5),
        dragHandleColor: scheme.outlineVariant,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.sheetTop),
      ),

      // ── Dialogs ──────────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: semantic.overlaySurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        barrierColor: AppColors.scrim,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        actionsPadding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 16),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.dialogAll),
        titleTextStyle: text.titleLarge,
        contentTextStyle: text.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
      ),

      // ── Snackbar ─────────────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.inverseSurface,
        actionTextColor: scheme.inversePrimary,
        disabledActionTextColor: scheme.onInverseSurface.withAlpha(97),
        contentTextStyle: text.bodyMedium?.copyWith(color: scheme.onInverseSurface),
        insetPadding: const EdgeInsets.all(AppSpacing.screenMargin),
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.lgAll),
      ),

      // ── Bottom navigation (72dp, indigo selected) ────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        elevation: 0,
        backgroundColor: scheme.surfaceContainerLowest,
        surfaceTintColor: Colors.transparent,
        indicatorColor: scheme.primaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (Set<WidgetState> states) => text.labelMedium?.copyWith(
            color: states.contains(WidgetState.selected) ? scheme.primary : scheme.onSurfaceVariant,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>(
          (Set<WidgetState> states) => IconThemeData(
            size: 24,
            color: states.contains(WidgetState.selected) ? scheme.primary : scheme.onSurfaceVariant,
          ),
        ),
      ),

      // ── Tabs ─────────────────────────────────────────────────────────────
      tabBarTheme: TabBarThemeData(
        labelColor: scheme.primary,
        unselectedLabelColor: scheme.onSurfaceVariant,
        labelStyle: text.labelMedium,
        unselectedLabelStyle: text.labelMedium,
        indicatorColor: scheme.primary,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: scheme.outlineVariant,
      ),

      // ── Calendar / date range picker (booking dates) ─────────────────────
      // Selected day = solid indigo circle, white label (as in the design).
      // Range middle = lavender band.
      datePickerTheme: DatePickerThemeData(
        backgroundColor: semantic.calendarFill,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.dialogAll),
        headerBackgroundColor: semantic.calendarFill,
        headerForegroundColor: scheme.onSurface,
        weekdayStyle: text.labelMedium,
        dayStyle: text.labelMedium,
        yearStyle: text.labelMedium,
        dayForegroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) return scheme.onPrimary;
            if (states.contains(WidgetState.disabled)) return scheme.onSurface.withValues(alpha: 0.38);
            return scheme.onSurface;
          },
        ),
        dayBackgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected) ? scheme.primary : Colors.transparent,
        ),
        todayForegroundColor: WidgetStatePropertyAll<Color>(scheme.primary),
        todayBorder: BorderSide(color: scheme.primary),
        rangePickerBackgroundColor: semantic.calendarFill,
        rangeSelectionBackgroundColor: scheme.primaryContainer,
        confirmButtonStyle: TextButton.styleFrom(foregroundColor: scheme.primary),
        cancelButtonStyle: TextButton.styleFrom(foregroundColor: scheme.onSurfaceVariant),
      ),

      // ── Selection controls ───────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return scheme.onSurface.withAlpha(97);
            }
            return states.contains(WidgetState.selected) ? scheme.onPrimary : scheme.outline;
          },
        ),
        trackColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return scheme.onSurface.withAlpha(31);
            }
            return states.contains(WidgetState.selected) ? scheme.primary : scheme.surfaceContainerHighest;
          },
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected) ? Colors.transparent : scheme.outline,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
        side: BorderSide(color: scheme.outline, width: 1.5),
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected) ? scheme.primary : Colors.transparent,
        ),
        checkColor: WidgetStatePropertyAll<Color>(scheme.onPrimary),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected) ? scheme.primary : scheme.outline,
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: scheme.primary,
        inactiveTrackColor: scheme.primaryContainer,
        thumbColor: scheme.primary,
        overlayColor: scheme.primary.withValues(alpha: 0.12),
        trackHeight: 4,
        rangeThumbShape: const RoundRangeSliderThumbShape(),
      ),

      // ── List tiles (settings, booking history) ───────────────────────────
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        minVerticalPadding: 12,
        minTileHeight: 56,
        iconColor: scheme.onSurface,
        textColor: scheme.onSurface,
        titleTextStyle: text.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        subtitleTextStyle: text.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.lgAll),
      ),

      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      badgeTheme: BadgeThemeData(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        textStyle: text.labelSmall,
        backgroundColor: scheme.primary,
        textColor: scheme.onPrimary,
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
        linearTrackColor: scheme.primaryContainer,
        circularTrackColor: scheme.primaryContainer,
      ),

      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: scheme.inverseSurface,
          borderRadius: AppRadius.mdAll,
        ),
        textStyle: text.bodyMedium?.copyWith(color: scheme.onInverseSurface),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        iconSize: 24,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.lgAll,
        ),
      ),
    );
  }
}
