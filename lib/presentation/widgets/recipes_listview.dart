import 'package:culinary_app/data/models/models.dart';
import 'package:culinary_app/logic/cubits/cubits.dart';
import 'package:culinary_app/presentation/screens/detail/recipe_detail_screen.dart';
import 'package:culinary_app/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesListView extends StatelessWidget {
  RecipesListView(
    this.title, {
    this.filter = const Filter(),
    this.showDelete = false,
  });

  final String title;
  final Filter filter;
  final bool showDelete;

  @override
  Widget build(BuildContext context) {
    context.read<RecipeCubit>().load(filter: filter);
    return SingleCardStruct(
      title,
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
      child: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is RecipesLoadSuccess) {
            final loaded = state.recipeResponse.recipes!.length;
            return loaded == 0
                ? Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 40.0),
                    child: AppText('Nothing to show', fontSize: 18))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: loaded + 1,
                    itemBuilder: (context, i) {
                      if (i == loaded) {
                        return _loadMore(loaded, state.recipeResponse.total,
                            loadMore: () {
                          context.read<RecipeCubit>().load(
                              filter: filter.copyWith(skip: loaded));
                        });
                      }
                      final r = state.recipeResponse.recipes![i];
                      return RecipeHorizontalCard(r.title,
                          person: r.person.toString(),
                          prepareTime: '${r.cookingTime} min',
                          imagePath: r.mainImage,
                          onDelete: !showDelete
                              ? null
                              : () => context
                                  .read<RecipeCubit>()
                                  .deleteRecipe(r.slug!),
                          onPressed: () =>
                              RecipeDetailScreen.route(context, r.slug));
                    });
          } else if (state is RecipesLoadFail) {
            return Center(child: Text(state.error));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _loadMore(int loaded, int? total, {required VoidCallback loadMore}) {
    if (loaded != total) {
      return TextButton(
        child: Text('Load more'),
        onPressed: loadMore,
      );
    }
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: AppText(
          'No more to show',
          fontSize: 16,
        ));
  }
}
