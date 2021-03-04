import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'recipe_event.dart';

part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial());

  RecipeRepository _repository = RecipeRepository();

  @override
  Stream<RecipeState> mapEventToState(
    RecipeEvent event,
  ) async* {
    if (event is LoadRecipes) {
      yield* _mapLoadRecipes(event);
    } else if (event is LoadRecipe) {
      yield* _mapLoadRecipe(event);
    } else if (event is LoadChefsRecipes) {
      yield* _mapLoadChefsRecipes(event);
    }
  }

  Stream<RecipeState> _mapLoadRecipes(LoadRecipes event) async* {
    try {
      var recipeResponse = await _repository.recipes(filter: event.filter);
      if (event.filter != null) {
        final s = state as SuccessLoadRecipes;
        s.recipeResponse.recipes!.addAll(recipeResponse.recipes!);
        recipeResponse.recipes = s.recipeResponse.recipes;
      }
      yield SuccessLoadRecipes(recipeResponse);
    } catch (e) {
      print(e);
      yield FailLoadRecipes('error while load');
    }
  }

  Stream<RecipeState> _mapLoadRecipe(LoadRecipe event) async* {
    try {
      final recipe = await _repository.recipe(event.slug);
      yield SuccessLoadRecipe(recipe);
    } catch (e) {
      print(e);
      yield FailLoadRecipe('error while load');
    }
  }

  Stream<RecipeState> _mapLoadChefsRecipes(LoadChefsRecipes event) async* {
    try {
      final recipes = await _repository.recipes(filter: Filter(chef: event.email));
      yield SuccessLoadChefsRecipes(recipes);
    } catch (e) {
      print(e);
      yield FailLoadChefsRecipes('error while load');
    }
  }

// Stream<RecipeState> _mapDeleteRecipe(LoadRecipes event) {
//   try {} catch (e) {}
// }
}
