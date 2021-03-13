part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  ThemeState({required this.themeMode, required this.isDark});

  final ThemeMode themeMode;
  final bool isDark;

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      themeMode: ThemeMode.values[map["themeMode"]],
      isDark: map["isDark"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "themeMode": this.themeMode.index,
      "isDark": this.isDark,
    };
  }

  @override
  List<Object> get props => [themeMode, isDark];
}
