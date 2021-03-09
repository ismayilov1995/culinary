import 'package:bloc/bloc.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light)) {
    changeTheme();
  }

  void changeTheme() {
    final Brightness brightness = AppTheme.currentSystemBrightness!;
    brightness == Brightness.light
        ? _setTheme(ThemeMode.light)
        : _setTheme(ThemeMode.dark);
  }

  void _setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarAndNavigationBarColor(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }
}
