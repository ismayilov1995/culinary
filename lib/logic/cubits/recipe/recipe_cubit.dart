import 'package:bloc/bloc.dart';
import 'package:culinary_app/core/exceptions/handle_error_messages.dart';
import 'package:culinary_app/data/models/models.dart';
import 'package:culinary_app/data/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final RecipeRepository _recipeRepository = RecipeRepository();

  RecipeCubit() : super(RecipeInitial());

  Future<void> load({Filter? filter}) async {
    try {
      if (state is RecipeInitial) emit(RecipesLoading());
      final res = await _recipeRepository.recipes(filter: filter);
      if (filter?.skip != null) {
        final s = state as RecipesLoadSuccess;
        s.recipeResponse.recipes!.addAll(res.recipes!);
        res.recipes = s.recipeResponse.recipes;
      }
      emit(RecipesLoadSuccess(res));
    } catch (e) {
      emit(RecipesLoadFail(HandleError.fetchError(e)));
    }
  }

  Future<void> loadRecipe(String slug) async {
    try {
      emit(RecipeLoading());
      final recipe = await _recipeRepository.recipe(slug);
      emit(RecipeLoadSuccess(recipe));
    } catch (e) {
      emit(RecipeLoadFail(HandleError.fetchError(e)));
    }
  }

  Future<void> deleteRecipe(String slug) async {
    try {
      await _recipeRepository.delete(slug);
      if (state is RecipeLoadSuccess) {
        final s = state as RecipesLoadSuccess;
        s.recipeResponse.recipes?.removeWhere((e) => e.slug == slug);
        emit(RecipesLoadSuccess(s.recipeResponse));
      }
    } catch (e) {
      print('not deleted');
    }
  }

  Future<void> create(Recipe recipe) async {
    try {
      emit(RecipeLoading());
      await _recipeRepository.create(recipe);
      emit(RecipeCreateSuccess());
    } catch (e) {
      emit(RecipeCreateFail(HandleError.fetchError(e)));
      emit(RecipeInitial());
    }
  }
}
