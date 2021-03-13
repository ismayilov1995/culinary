import 'package:culinary_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color(0xfff2f2f2);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightParticlesColor = const Color(0x44948282);

  static Color darkBackgroundColor = const Color(0xFF1A2127);
  static Color darkPrimaryColor = const Color(0xFF1A2127);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static Color darkParticlesColor = const Color(0x441C2A3D);

  const AppTheme._();

  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: lightPrimaryColor,
    accentColor: lightAccentColor,
    backgroundColor: lightBackgroundColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    accentColor: darkAccentColor,
    backgroundColor: darkBackgroundColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static Brightness? get currentSystemBrightness =>
      SchedulerBinding.instance?.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    bool themeIsLight = themeMode == ThemeMode.light;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeIsLight ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeIsLight ? Brightness.dark : Brightness.light,
      systemNavigationBarColor:
          themeIsLight ? lightBackgroundColor : darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

extension ThemeExtras on ThemeData {
  Color get recipeCardBG => isLight ? kLightCardBg : kDarkCardBg;

  Color get helperTextColor => isLight ? kLightHelperTC : kDarkHelperTC;

  Color get textFieldBG => isLight ? kLightTextFieldBg : kDarkTextFieldBg;

  Color get textColor => isLight ? kDarkCardBg : kLightCardBg;

  BoxShadow get cardShadow => isLight ? kLightCardShadow : kDarkCardShadow;

  bool get isLight => this.brightness == Brightness.light;
}
