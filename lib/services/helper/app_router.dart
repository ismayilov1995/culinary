import 'package:culinary_app/ui/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static Route router(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case HomeScreen.pageID:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
