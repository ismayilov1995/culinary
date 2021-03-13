import 'package:culinary_app/data/repositories/repositories.dart';
import 'package:culinary_app/logic/blocs/auth/authentication_bloc.dart';
import 'package:culinary_app/logic/cubits/cubits.dart';
import 'package:culinary_app/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const pageID = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          }
        },
        child: SafeArea(
          child: ListView(
            primary: false,
            physics: BouncingScrollPhysics(),
            children: [
              UserWelcomeRow(),
              SearchRow(),
              BlocProvider(
                  create: (_) => RecipeCubit(), child: RecommendRecipesRow()),
              BlocProvider(
                  create: (_) => RecipeCubit(),
                  child: RecipesListView('Latest Recipes')),
            ],
          ),
        ),
      ),
    );
  }
}
