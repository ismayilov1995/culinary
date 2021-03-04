import 'package:culinary_app/blocs/blocs.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/ui/screens/screens.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesListView extends StatelessWidget {
  RecipesListView({this.filter});

  final Filter? filter;

  @override
  Widget build(BuildContext context) {
    context.read<RecipeBloc>().add(LoadRecipes());
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state is SuccessLoadRecipes) {
          final loaded = state.recipeResponse.recipes!.length;
          return SingleCardStruct('New Recipe',
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: loaded + 1,
                  itemBuilder: (context, i) {
                    if (loaded == i) {
                      return TextButton(
                        child: Text('Load more'),
                        onPressed: () {
                          if (loaded == state.recipeResponse.total) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                  content: Text('Sorry, no more recipes')));
                          }
                          context
                              .read<RecipeBloc>()
                              .add(LoadRecipes(filter: Filter(skip: loaded)));
                        },
                      );
                    }
                    final r = state.recipeResponse.recipes![i];
                    return RecipeHorizontalCard(
                      r.title,
                      person: r.person.toString(),
                      prepareTime: '${r.cookingTime} min',
                      imagePath: r.mainImage,
                      onPressed: () =>
                          RecipeDetailScreen.route(context, r.slug),
                    );
                  }));
        } else if (state is FailLoadRecipes) {
          return Center(child: Text(state.error));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
