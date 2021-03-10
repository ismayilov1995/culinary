import 'package:culinary_app/ui/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: kLightPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: kDarkBgColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static Brightness? get currentSystemBrightness =>
      SchedulerBinding.instance?.window.platformBrightness;

  static setStatusBarAndNavigationBarColor(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor:
          themeMode == ThemeMode.light ? Colors.black : Colors.white,
      systemNavigationBarDividerColor:
          themeMode == ThemeMode.light ? Colors.black : Colors.white,
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
