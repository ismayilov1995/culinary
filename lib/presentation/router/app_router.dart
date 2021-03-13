import 'dart:convert';

import 'package:culinary_app/core/exceptions/route_exception.dart';
import 'package:culinary_app/logic/cubits/cubits.dart';
import 'package:culinary_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String counter = 'counter';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case HomeScreen.pageID:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RecipeDetailScreen.pageID:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => RecipeCubit()),
                  ],
                  child: RecipeDetailScreen(arguments as String),
                ));
      case ChefDetailScreen.pageID:
        final data = jsonDecode(arguments as String);
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => ChefCubit()),
                    BlocProvider(create: (context) => RecipeCubit()),
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
              create: (context) => RecipeCubit(), child: CreateRecipeScreen()),
        );
      case ResultScreen.pageID:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => RecipeCubit(),
              child: ResultScreen(arguments as String)),
        );

      default:
        throw const RouteException('Route not found!');
    }
  }
}
