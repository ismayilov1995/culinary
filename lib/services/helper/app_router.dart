import 'package:culinary_app/ui/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static Route router(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case SplashScreen.pageID:
      default:
        return SplashScreen.route();
    }
  }
}
