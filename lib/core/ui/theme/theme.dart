import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/ui/theme/chrono_colors.dart';
import 'package:myapp/core/ui/theme/material_scheme.dart';

class ChronoTheme {
  final TextTheme textTheme;

  const ChronoTheme(this.textTheme);

  //Light Theme
  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    primaryColor: colorScheme.primary,
    shadowColor: colorScheme.shadow,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      shadowColor: colorScheme.shadow,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: colorScheme.primary),
    cardTheme: CardThemeData(color: colorScheme.primaryContainer),
  );

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

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff004768),
      surfaceTint: Color(0xff256489),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3f7aa0),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff344552),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff657785),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff483d5e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7a6f93),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff7f9fe),
      onBackground: Color(0xff181c20),
      surface: Color(0xfff7f9fe),
      onSurface: Color(0xff181c20),
      surfaceVariant: Color(0xffdde3ea),
      onSurfaceVariant: Color(0xff3d4449),
      outline: Color(0xff596066),
      outlineVariant: Color(0xff757b82),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inverseOnSurface: Color(0xffeef1f6),
      inversePrimary: Color(0xff94cdf7),
      primaryFixed: Color(0xff3f7aa0),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff226186),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff657785),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4d5e6c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7a6f93),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff615679),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff7f9fe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f9),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe5e8ed),
      surfaceContainerHighest: Color(0xffdfe3e8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff002538),
      surfaceTint: Color(0xff256489),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004768),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff132430),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff344552),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff261d3c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff483d5e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff7f9fe),
      onBackground: Color(0xff181c20),
      surface: Color(0xfff7f9fe),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffdde3ea),
      onSurfaceVariant: Color(0xff1e252a),
      outline: Color(0xff3d4449),
      outlineVariant: Color(0xff3d4449),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffdceeff),
      primaryFixed: Color(0xff004768),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003048),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff344552),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1e2f3b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff483d5e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff312747),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff7f9fe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f9),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe5e8ed),
      surfaceContainerHighest: Color(0xffdfe3e8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
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

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xff98d1fb),
      surfaceTint: Color(0xff94cdf7),
      onPrimary: Color(0xff001827),
      primaryContainer: Color(0xff5e97be),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffbbcddd),
      onSecondary: Color(0xff061823),
      secondaryContainer: Color(0xff8193a2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffd2c4ed),
      onTertiary: Color(0xff1a112f),
      tertiaryContainer: Color(0xff978bb0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff101417),
      onBackground: Color(0xffdfe3e8),
      surface: Color(0xff101417),
      onSurface: Color(0xfff9fbff),
      surfaceVariant: Color(0xff41474d),
      onSurfaceVariant: Color(0xffc5cbd2),
      outline: Color(0xff9da3aa),
      outlineVariant: Color(0xff7e848a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e8),
      inverseOnSurface: Color(0xff262a2e),
      inversePrimary: Color(0xff004d70),
      primaryFixed: Color(0xffc9e6ff),
      onPrimaryFixed: Color(0xff00131f),
      primaryFixedDim: Color(0xff94cdf7),
      onPrimaryFixedVariant: Color(0xff003a56),
      secondaryFixed: Color(0xffd3e5f5),
      onSecondaryFixed: Color(0xff02131e),
      secondaryFixedDim: Color(0xffb7c9d9),
      onSecondaryFixedVariant: Color(0xff273845),
      tertiaryFixed: Color(0xffeaddff),
      onTertiaryFixed: Color(0xff150b2a),
      tertiaryFixedDim: Color(0xffcec0e8),
      onTertiaryFixedVariant: Color(0xff3b3151),
      surfaceDim: Color(0xff101417),
      surfaceBright: Color(0xff353a3e),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff262a2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff9fbff),
      surfaceTint: Color(0xff94cdf7),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff98d1fb),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff9fbff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbbcddd),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd2c4ed),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff101417),
      onBackground: Color(0xffdfe3e8),
      surface: Color(0xff101417),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff41474d),
      onSurfaceVariant: Color(0xfff9fbff),
      outline: Color(0xffc5cbd2),
      outlineVariant: Color(0xffc5cbd2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e8),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff002d44),
      primaryFixed: Color(0xffd1eaff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff98d1fb),
      onPrimaryFixedVariant: Color(0xff001827),
      secondaryFixed: Color(0xffd7e9fa),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbbcddd),
      onSecondaryFixedVariant: Color(0xff061823),
      tertiaryFixed: Color(0xffede2ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd2c4ed),
      onTertiaryFixedVariant: Color(0xff1a112f),
      surfaceDim: Color(0xff101417),
      surfaceBright: Color(0xff353a3e),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff262a2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  List<ExtendedColor> get extendedColors => [];

  static bool isDarkTheme(BuildContext context) {
    return AdaptiveThemeMode.dark == AdaptiveTheme.of(context).mode;
  }
}
