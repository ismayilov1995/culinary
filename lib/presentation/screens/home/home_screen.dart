import 'package:culinary_app/data/models/models.dart';
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
                  create: (_) => RecipeCubit(), child: _RecommendList()),
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

class _RecommendList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<RecipeCubit>().load(filter: Filter(popular: true));
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        if (state is RecipesLoadSuccess) {
          return RecommendRecipes(
            title: 'Recommended',
            recipeResponse: state.recipeResponse,
          );
        } else if (state is RecipesLoadFail) {
          return Center(child: Text(state.error));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
