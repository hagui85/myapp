import 'dart:ui';

class ComponentColors {
  static final ComponentColors _singleton = ComponentColors._();

  factory ComponentColors() => _singleton;

  ComponentColors._();

  Color borderColor(Color borderColor) => borderColor;

  Color containerColor(Color containerColor) => containerColor;
}

final class ChronoColors {
  static final ChronoColors _singleton = ChronoColors._();

  factory ChronoColors() => _singleton;

  ChronoColors._();

  // Light mode colors
  static const Color md_theme_light_primary = Color(0xff27638a);
  static const Color md_theme_light_surfaceTint = Color(0xff27638a);
  static const Color md_theme_light_onPrimary = Color(0xffffffff);
  static const Color md_theme_light_primaryContainer = Color(0xffcae6ff);
  static const Color md_theme_light_onPrimaryContainer = Color(0xff001e30);
  static const Color md_theme_light_secondary = Color(0xff4f606e);
  static const Color md_theme_light_onSecondary = Color(0xffffffff);
  static const Color md_theme_light_secondaryContainer = Color(0xffd3e5f5);
  static const Color md_theme_light_onSecondaryContainer = Color(0xff0b1d29);
  static const Color md_theme_light_tertiary = Color(0xff64597c);
  static const Color md_theme_light_onTertiary = Color(0xffffffff);
  static const Color md_theme_light_tertiaryContainer = Color(0xffeaddff);
  static const Color md_theme_light_onTertiaryContainer = Color(0xff1f1635);
  static const Color md_theme_light_error = Color(0xffba1a1a);
  static const Color md_theme_light_onError = Color(0xffffffff);
  static const Color md_theme_light_errorContainer = Color(0xffffdad6);
  static const Color md_theme_light_onErrorContainer = Color(0xff410002);
  static const Color md_theme_light_background = Color(0xfff7f9fe);
  static const Color md_theme_light_onBackground = Color(0xff181c20);
  static const Color md_theme_light_surface = Color(0xfff7f9fe);
  static const Color md_theme_light_onSurface = Color(0xff181c20);
  static const Color md_theme_light_surfaceVariant = Color(0xffdde3ea);
  static const Color md_theme_light_onSurfaceVariant = Color(0xff41474d);
  static const Color md_theme_light_outline = Color(0xff71787e);
  static const Color md_theme_light_outlineVariant = Color(0xffc1c7ce);
  static const Color md_theme_light_shadow = Color(0xff000000);
  static const Color md_theme_light_scrim = Color(0xff000000);
  static const Color md_theme_light_inverseSurface = Color(0xff2d3135);
  static const Color md_theme_light_inverseOnSurface = Color(0xffeef1f6);
  static const Color md_theme_light_inversePrimary = Color(0xff94cdf7);
  static const Color md_theme_light_primaryFixed = Color(0xffc9e6ff);
  static const Color md_theme_light_onPrimaryFixed = Color(0xff001e2f);
  static const Color md_theme_light_primaryFixedDim = Color(0xff94cdf7);
  static const Color md_theme_light_onPrimaryFixedVariant = Color(0xff004c6e);
  static const Color md_theme_light_secondaryFixed = Color(0xffd3e5f5);
  static const Color md_theme_light_onSecondaryFixed = Color(0xff0b1d29);
  static const Color md_theme_light_secondaryFixedDim = Color(0xffb7c9d9);
  static const Color md_theme_light_onSecondaryFixedVariant = Color(0xff384956);
  static const Color md_theme_light_tertiaryFixed = Color(0xffeaddff);
  static const Color md_theme_light_onTertiaryFixed = Color(0xff1f1635);
  static const Color md_theme_light_tertiaryFixedDim = Color(0xffcec0e8);
  static const Color md_theme_light_onTertiaryFixedVariant = Color(0xff4c4163);
  static const Color md_theme_light_surfaceDim = Color(0xffd7dadf);
  static const Color md_theme_light_surfaceBright = Color(0xfff7f9fe);
  static const Color md_theme_light_surfaceContainerLowest = Color(0xffffffff);
  static const Color md_theme_light_surfaceContainerLow = Color(0xfff1f4f9);
  static const Color md_theme_light_surfaceContainer = Color(0xffebeef3);
  static const Color md_theme_light_surfaceContainerHigh = Color(0xffe5e8ed);
  static const Color md_theme_light_surfaceContainerHighest = Color(0xffdfe3e8);

  // Dark mode colors
  static const Color md_theme_dark_primary = Color(0xff96cdf8);
  static const Color md_theme_dark_surfaceTint = Color(0xff96cdf8);
  static const Color md_theme_dark_onPrimary = Color(0xff00344f);
  static const Color md_theme_dark_primaryContainer = Color(0xff004b70);
  static const Color md_theme_dark_onPrimaryContainer = Color(0xffcae6ff);
  static const Color md_theme_dark_secondary = Color(0xffb7c9d9);
  static const Color md_theme_dark_onSecondary = Color(0xff21323f);
  static const Color md_theme_dark_secondaryContainer = Color(0xff384956);
  static const Color md_theme_dark_onSecondaryContainer = Color(0xffd3e5f5);
  static const Color md_theme_dark_tertiary = Color(0xffcec0e8);
  static const Color md_theme_dark_onTertiary = Color(0xff352b4b);
  static const Color md_theme_dark_tertiaryContainer = Color(0xff4c4163);
  static const Color md_theme_dark_onTertiaryContainer = Color(0xffeaddff);
  static const Color md_theme_dark_error = Color(0xffffb4ab);
  static const Color md_theme_dark_onError = Color(0xff690005);
  static const Color md_theme_dark_errorContainer = Color(0xff93000a);
  static const Color md_theme_dark_onErrorContainer = Color(0xffffdad6);
  static const Color md_theme_dark_background = Color(0xff101417);
  static const Color md_theme_dark_onBackground = Color(0xffdfe3e8);
  static const Color md_theme_dark_surface = Color(0xff101417);
  static const Color md_theme_dark_onSurface = Color(0xffdfe3e8);
  static const Color md_theme_dark_surfaceVariant = Color(0xff41474d);
  static const Color md_theme_dark_onSurfaceVariant = Color(0xffc1c7ce);
  static const Color md_theme_dark_outline = Color(0xff8b9198);
  static const Color md_theme_dark_outlineVariant = Color(0xff41474d);
  static const Color md_theme_dark_shadow = Color(0xff000000);
  static const Color md_theme_dark_scrim = Color(0xff000000);
  static const Color md_theme_dark_inverseSurface = Color(0xffdfe3e8);
  static const Color md_theme_dark_inverseOnSurface = Color(0xff2d3135);
  static const Color md_theme_dark_inversePrimary = Color(0xff256489);
  static const Color md_theme_dark_primaryFixed = Color(0xffc9e6ff);
  static const Color md_theme_dark_onPrimaryFixed = Color(0xff001e2f);
  static const Color md_theme_dark_primaryFixedDim = Color(0xff94cdf7);
  static const Color md_theme_dark_onPrimaryFixedVariant = Color(0xff004c6e);
  static const Color md_theme_dark_secondaryFixed = Color(0xffd3e5f5);
  static const Color md_theme_dark_onSecondaryFixed = Color(0xff0b1d29);
  static const Color md_theme_dark_secondaryFixedDim = Color(0xffb7c9d9);
  static const Color md_theme_dark_onSecondaryFixedVariant = Color(0xff384956);
  static const Color md_theme_dark_tertiaryFixed = Color(0xffeaddff);
  static const Color md_theme_dark_onTertiaryFixed = Color(0xff1f1635);
  static const Color md_theme_dark_tertiaryFixedDim = Color(0xffcec0e8);
  static const Color md_theme_dark_onTertiaryFixedVariant = Color(0xff4c4163);
  static const Color md_theme_dark_surfaceDim = Color(0xff101417);
  static const Color md_theme_dark_surfaceBright = Color(0xff353a3e);
  static const Color md_theme_dark_surfaceContainerLowest = Color(0xff0a0f12);
  static const Color md_theme_dark_surfaceContainerLow = Color(0xff181c20);
  static const Color md_theme_dark_surfaceContainer = Color(0xff1c2024);
  static const Color md_theme_dark_surfaceContainerHigh = Color(0xff262a2e);
  static const Color md_theme_dark_surfaceContainerHighest = Color(0xff313539);

  // Palette
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xff484848);
  static const Color grey = Color(0xff646464);
  static const Color lightGrey = Color(0xff969696);
  static const Color white = Color(0xFFFFFFFF);

  // Custom colors
  static const Color seed = Color(0xFF009ADF);
  static const Color darkSeed = Color(0xFF0060A2);
  static const Color error = Color(0xFFE80303);
  static const Color warning = Color(0xffe88014);
  static const Color success = Color(0xFF4CAF50);
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
