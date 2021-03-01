import 'package:culinary_app/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:culinary_app/blocs/blocs.dart';

class AppRouting {
  static Route router(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case HomeScreen.pageID:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => RecipeBloc(), child: HomeScreen()));
      case RecipeDetailScreen.pageID:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => RecipeBloc(),
                child: RecipeDetailScreen(arguments)));
      case ChefDetailScreen.pageID:
        return MaterialPageRoute(builder: (_) => ChefDetailScreen(arguments));
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
