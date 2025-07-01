import 'package:flutter/material.dart';
// adapte le chemin

class _Colors {
  Color get mPrimaryColor => const Color(0xff009ADF);
  Color get mPrimaryKColor => const Color(0xff0060A2);
  Color get mPrimaryBottom => const Color(0x88FFFFFF);
  Color get mBackGroundGray => const Color(0xFFEEEEEE);
}

class _Assets {
  String get logo => "assets/icons/logo.png";
}

class _Values {
  String get appName => "Chrono driver";
}

class _TextStyles {
  final _Colors colors;

  _TextStyles(this.colors);
}

class AppTheme extends InheritedWidget {
  final ThemeData themeData;
  final _Colors colors = _Colors();
  final _Values values = _Values();
  final _Assets assets = _Assets();
  late final _TextStyles textStyles;

  AppTheme({super.key, required super.child, required this.themeData}) {
    textStyles = _TextStyles(colors);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>();
  }
}
