import 'package:culinary_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
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
  Color get recipeCardBG => isLight ? lightCardBg : darkCardBg;

  Color get helperTextColor => isLight ? lightHelperTC : darkHelperTC;

  Color get textFieldBG => isLight ? lightTextFieldBg : darkTextFieldBg;

  Color get textColor => isLight ? darkCardBg : lightCardBg;

  BoxShadow get cardShadow => isLight ? kLightCardShadow : kDarkCardShadow;

  bool get isLight => this.brightness == Brightness.light;
}
