import 'dart:convert';

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
            builder: (_) => HomeScreen());
      case RecipeDetailScreen.pageID:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => RecipeBloc(),
                child: RecipeDetailScreen(arguments as String?)));
      case ChefDetailScreen.pageID:
        final data = jsonDecode(arguments as String);
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => ChefBloc()),
                    BlocProvider(create: (context) => RecipeBloc()),
                  ],
                  child: ChefDetailScreen(
                    data['email'],
                    data['id'],
                    isUser: data['isUser'],
                  ),
                ));
      case LoginScreen.pageID:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => LoginCubit(), child: LoginScreen()),
        );
      case RegisterScreen.pageID:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => RegisterCubit(), child: RegisterScreen()),
        );
      case CreateRecipeScreen.pageID:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => RecipeBloc(), child: CreateRecipeScreen()),
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
