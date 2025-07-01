import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/core/ui/theme/chrono_colors.dart';
import 'package:myapp/core/ui/theme/material_scheme.dart';

class ChronoTheme {
  static ThemeData get light => _baseTheme(Brightness.light);
  static ThemeData get dark => _baseTheme(Brightness.dark);
  static final MaterialScheme _lightScheme = lightScheme();
  static final MaterialScheme _darkScheme = darkScheme();

  static ThemeData _baseTheme(Brightness brightness) {
    final colorScheme = brightness == Brightness.light
        ? _lightScheme.toColorScheme()
        : _darkScheme.toColorScheme();

    final baseTheme = ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colorScheme.onPrimary,
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      iconTheme: IconThemeData(color: colorScheme.onSurface),
    );
  }

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: ChronoColors.md_theme_light_primary,
      onPrimary: ChronoColors.md_theme_light_onPrimary,
      primaryContainer: ChronoColors.md_theme_light_primaryContainer,
      onPrimaryContainer: ChronoColors.md_theme_light_onPrimaryContainer,
      secondary: ChronoColors.md_theme_light_secondary,
      onSecondary: ChronoColors.md_theme_light_onSecondary,
      secondaryContainer: ChronoColors.md_theme_light_secondaryContainer,
      onSecondaryContainer: ChronoColors.md_theme_light_onSecondaryContainer,
      tertiary: ChronoColors.md_theme_light_tertiary,
      onTertiary: ChronoColors.md_theme_light_onTertiary,
      tertiaryContainer: ChronoColors.md_theme_light_tertiaryContainer,
      onTertiaryContainer: ChronoColors.md_theme_light_onTertiaryContainer,
      error: ChronoColors.md_theme_light_error,
      onError: ChronoColors.md_theme_light_onError,
      errorContainer: ChronoColors.md_theme_light_errorContainer,
      onErrorContainer: ChronoColors.md_theme_light_onErrorContainer,
      background: ChronoColors.md_theme_light_background,
      onBackground: ChronoColors.md_theme_light_onBackground,
      surface: ChronoColors.md_theme_light_surface,
      onSurface: ChronoColors.md_theme_light_onSurface,
      surfaceTint: ChronoColors.md_theme_light_surfaceTint,
      surfaceVariant: ChronoColors.md_theme_light_surfaceVariant,
      onSurfaceVariant: ChronoColors.md_theme_light_onSurfaceVariant,
      outline: ChronoColors.md_theme_light_outline,
      outlineVariant: ChronoColors.md_theme_light_outlineVariant,
      shadow: ChronoColors.md_theme_light_shadow,
      scrim: ChronoColors.md_theme_light_scrim,
      inverseSurface: ChronoColors.md_theme_light_inverseSurface,
      inverseOnSurface: ChronoColors.md_theme_light_inverseOnSurface,
      inversePrimary: ChronoColors.md_theme_light_inversePrimary,
      primaryFixed: ChronoColors.md_theme_light_primaryFixed,
      onPrimaryFixed: ChronoColors.md_theme_light_onPrimaryFixed,
      primaryFixedDim: ChronoColors.md_theme_light_primaryFixedDim,
      onPrimaryFixedVariant: ChronoColors.md_theme_light_onPrimaryFixedVariant,
      secondaryFixed: ChronoColors.md_theme_light_secondaryFixed,
      onSecondaryFixed: ChronoColors.md_theme_light_onSecondaryFixed,
      secondaryFixedDim: ChronoColors.md_theme_light_secondaryFixedDim,
      onSecondaryFixedVariant:
          ChronoColors.md_theme_light_onSecondaryFixedVariant,
      tertiaryFixed: ChronoColors.md_theme_light_tertiaryFixed,
      onTertiaryFixed: ChronoColors.md_theme_light_onTertiaryFixed,
      tertiaryFixedDim: ChronoColors.md_theme_light_tertiaryFixedDim,
      onTertiaryFixedVariant:
          ChronoColors.md_theme_light_onTertiaryFixedVariant,
      surfaceDim: ChronoColors.md_theme_light_surfaceDim,
      surfaceBright: ChronoColors.md_theme_light_surfaceBright,
      surfaceContainerLowest:
          ChronoColors.md_theme_light_surfaceContainerLowest,
      surfaceContainerLow: ChronoColors.md_theme_light_surfaceContainerLow,
      surfaceContainer: ChronoColors.md_theme_light_surfaceContainer,
      surfaceContainerHigh: ChronoColors.md_theme_light_surfaceContainerHigh,
      surfaceContainerHighest:
          ChronoColors.md_theme_light_surfaceContainerHighest,
    );
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: ChronoColors.md_theme_dark_primary,
      onPrimary: ChronoColors.md_theme_dark_onPrimary,
      primaryContainer: ChronoColors.md_theme_dark_primaryContainer,
      onPrimaryContainer: ChronoColors.md_theme_dark_onPrimaryContainer,
      secondary: ChronoColors.md_theme_dark_secondary,
      onSecondary: ChronoColors.md_theme_dark_onSecondary,
      secondaryContainer: ChronoColors.md_theme_dark_secondaryContainer,
      onSecondaryContainer: ChronoColors.md_theme_dark_onSecondaryContainer,
      tertiary: ChronoColors.md_theme_dark_tertiary,
      onTertiary: ChronoColors.md_theme_dark_onTertiary,
      tertiaryContainer: ChronoColors.md_theme_dark_tertiaryContainer,
      onTertiaryContainer: ChronoColors.md_theme_dark_onTertiaryContainer,
      error: ChronoColors.md_theme_dark_error,
      onError: ChronoColors.md_theme_dark_onError,
      errorContainer: ChronoColors.md_theme_dark_errorContainer,
      onErrorContainer: ChronoColors.md_theme_dark_onErrorContainer,
      background: ChronoColors.md_theme_dark_background,
      onBackground: ChronoColors.md_theme_dark_onBackground,
      surface: ChronoColors.md_theme_dark_surface,
      onSurface: ChronoColors.md_theme_dark_onSurface,
      surfaceTint: ChronoColors.md_theme_dark_surfaceTint,
      surfaceVariant: ChronoColors.md_theme_dark_surfaceVariant,
      onSurfaceVariant: ChronoColors.md_theme_dark_onSurfaceVariant,
      outline: ChronoColors.md_theme_dark_outline,
      outlineVariant: ChronoColors.md_theme_dark_outlineVariant,
      shadow: ChronoColors.md_theme_dark_shadow,
      scrim: ChronoColors.md_theme_dark_scrim,
      inverseSurface: ChronoColors.md_theme_dark_inverseSurface,
      inverseOnSurface: ChronoColors.md_theme_dark_inverseOnSurface,
      inversePrimary: ChronoColors.md_theme_dark_inversePrimary,
      primaryFixed: ChronoColors.md_theme_dark_primaryFixed,
      onPrimaryFixed: ChronoColors.md_theme_dark_onPrimaryFixed,
      primaryFixedDim: ChronoColors.md_theme_dark_primaryFixedDim,
      onPrimaryFixedVariant: ChronoColors.md_theme_dark_onPrimaryFixedVariant,
      secondaryFixed: ChronoColors.md_theme_dark_secondaryFixed,
      onSecondaryFixed: ChronoColors.md_theme_dark_onSecondaryFixed,
      secondaryFixedDim: ChronoColors.md_theme_dark_secondaryFixedDim,
      onSecondaryFixedVariant:
          ChronoColors.md_theme_dark_onSecondaryFixedVariant,
      tertiaryFixed: ChronoColors.md_theme_dark_tertiaryFixed,
      onTertiaryFixed: ChronoColors.md_theme_dark_onTertiaryFixed,
      tertiaryFixedDim: ChronoColors.md_theme_dark_tertiaryFixedDim,
      onTertiaryFixedVariant: ChronoColors.md_theme_dark_onTertiaryFixedVariant,
      surfaceDim: ChronoColors.md_theme_dark_surfaceDim,
      surfaceBright: ChronoColors.md_theme_dark_surfaceBright,
      surfaceContainerLowest: ChronoColors.md_theme_dark_surfaceContainerLowest,
      surfaceContainerLow: ChronoColors.md_theme_dark_surfaceContainerLow,
      surfaceContainer: ChronoColors.md_theme_dark_surfaceContainer,
      surfaceContainerHigh: ChronoColors.md_theme_dark_surfaceContainerHigh,
      surfaceContainerHighest:
          ChronoColors.md_theme_dark_surfaceContainerHighest,
    );
  }
}
