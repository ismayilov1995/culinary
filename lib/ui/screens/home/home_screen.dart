import 'package:culinary_app/models/auth_model.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/repositories/repositories.dart';
import 'package:culinary_app/ui/screens/screens.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:culinary_app/blocs/blocs.dart';

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
