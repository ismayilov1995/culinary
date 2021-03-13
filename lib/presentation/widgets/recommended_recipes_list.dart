import 'package:culinary_app/data/models/models.dart';
import 'package:culinary_app/presentation/screens/detail/recipe_detail_screen.dart';
import 'package:culinary_app/presentation/widgets/recommend_card.dart';
import 'package:culinary_app/presentation/widgets/single_card.dart';
import 'package:flutter/material.dart';

class RecommendRecipes extends StatelessWidget {
  final String title;
  final RecipeResponse recipeResponse;

  RecommendRecipes({required this.title, required this.recipeResponse});

  @override
  Widget build(BuildContext context) {
    return SingleCardStruct(
      title,
      child: SizedBox(
        height: 250,
        child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20.0),
            scrollDirection: Axis.horizontal,
            itemCount: recipeResponse.recipes!.length,
            itemBuilder: (context, i) {
              final r = recipeResponse.recipes![i];
              return RecommendCard(
                r.title,
                person: r.person.toString(),
                prepareTime: '${r.cookingTime} min',
                imagePath: r.mainImage,
                index: i,
                onPressed: () => RecipeDetailScreen.route(context, r.slug),
              );
            }),
      ),
    );
  }
}
