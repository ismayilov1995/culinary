part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  ThemeState({required this.themeMode});

  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];
}