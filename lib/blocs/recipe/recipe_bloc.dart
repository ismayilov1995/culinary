import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/helper/handle_error_messages.dart';
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
    } else if (event is CreateRecipe) {
      yield* _mapCreateRecipe(event);
    } else if (event is Check) {
      yield* _mapCheckRecipe(event);
    } else if (event is DeleteRecipe) {
      yield* _mapDeleteRecipe(event);
    }
  }

  Stream<RecipeState> _mapLoadRecipes(LoadRecipes event) async* {
    try {
      var recipeResponse = await _repository.recipes(filter: event.filter);
      if (event.filter?.skip != null) {
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

  Stream<RecipeState> _mapCreateRecipe(CreateRecipe event) async* {
    try {
      final created = await _repository.create(event.recipe);
      yield SuccessCreateRecipe(created);
    } catch (e) {
      yield FailCreateRecipe(HandleError.fetchError(e));
    }
    yield RecipeInitial();
  }

  Stream<RecipeState> _mapCheckRecipe(Check event) async* {
    try {
      await _repository.check();
    } catch (e) {
      print(e);
    }
  }

  Stream<RecipeState> _mapDeleteRecipe(DeleteRecipe event) async* {
    try {
      await _repository.delete(event.slug);
      if (state is SuccessLoadRecipes) {
        (state as SuccessLoadRecipes)
            .recipeResponse
            .recipes!
            .removeWhere((e) => e.slug == event.slug);
        yield SuccessLoadRecipes((state as SuccessLoadRecipes).recipeResponse);
      }
    } catch (e) {
      print(e);
    }
  }
}
