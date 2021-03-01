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
    }
  }

  Stream<RecipeState> _mapLoadRecipes(LoadRecipes event) async* {
    try {
      final recipeResponse = await _repository.recipes(filter: event.filter);
      yield SuccessLoadRecipes(recipeResponse);
    } catch (e) {
      yield FailLoadRecipes('error while load');
    }
  }

  Stream<RecipeState> _mapLoadRecipe(LoadRecipe event) async* {
    try {
      final recipe = await _repository.recipe(event.slug);
      yield SuccessLoadRecipe(recipe);
    } catch (e) {
      yield FailLoadRecipe('error while load');
    }
  }

// Stream<RecipeState> _mapDeleteRecipe(LoadRecipes event) {
//   try {} catch (e) {}
// }
}
