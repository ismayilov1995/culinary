import 'package:bloc/bloc.dart';
import 'package:culinary_app/core/themes/app_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> with HydratedMixin {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light, isDark: false));

  void setTheme() {
    final isDark = state.themeMode == ThemeMode.dark;
    AppTheme.setStatusBarAndNavigationBarColors(state.themeMode);
    emit(ThemeState(
        themeMode: isDark ? ThemeMode.light : ThemeMode.dark, isDark: !isDark));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic>? map) {
    if (map == null) return null;
    return ThemeState.fromMap(map);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
