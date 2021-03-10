import 'package:culinary_app/blocs/blocs.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/ui/screens/screens.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendRecipesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<RecipeBloc>().add(LoadRecipes(filter: Filter(popular: true)));
    return SingleCardStruct(
      'Recommended',
      child: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is SuccessLoadRecipes) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 20.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.recipeResponse.recipes!.length,
                  itemBuilder: (context, i) {
                    final r = state.recipeResponse.recipes![i];
                    return RecommendCard(
                      r.title,
                      person: r.person.toString(),
                      prepareTime: '${r.cookingTime} min',
                      imagePath: r.mainImage,
                      index: i,
                      onPressed: () =>
                          RecipeDetailScreen.route(context, r.slug),
                    );
                  }),
            );
          } else if (state is FailLoadRecipes) {
            return Center(child: Text(state.error));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}