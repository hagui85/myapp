import 'package:flutter/material.dart';

class _TextStyles {
  final _Colors colors;

  _TextStyles(this.colors);

  // static const roboto = "Roboto";
}

class _Colors {
  Color get mPrimaryColor => const Color(0xff009ADF);
  Color get mPrimaryKColor => const Color(0xff0060A2);
  Color get mPrimaryBottom => const Color(0x88FFFFFF);
  Color get mBackGroundGray => const Color(0xFFEEEEEE);
}

class _Assets {
  // splash screen assets
  String get logo => "assets/icons/logo.png";
}

class _Values {
  String get appName => "Chrono driver";
}

class AppTheme extends InheritedWidget {
  final _Colors colors = _Colors();
  final _Values values = _Values();
  final _Assets assets = _Assets();
  late final _TextStyles textStyles;

  AppTheme({super.key, required super.child}) {
    textStyles = _TextStyles(colors);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>();
  }
}
