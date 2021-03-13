import 'package:culinary_app/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:culinary_app/logic/blocs/blocs.dart';

class HomeScreen extends StatelessWidget {
  static const pageID = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          primary: false,
          physics: BouncingScrollPhysics(),
          children: [
            UserWelcomeRow(),
            SearchRow(),
            BlocProvider(
                create: (context) => RecipeBloc(),
                child: RecommendRecipesRow()),
            BlocProvider(
              create: (context) => RecipeBloc(),
              child: RecipesListView('Latest Recipes'),
            )
          ],
        ),
      ),
    );
  }
}
