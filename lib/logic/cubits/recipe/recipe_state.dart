part of 'recipe_cubit.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipesLoading extends RecipeState {}

class RecipesLoadSuccess extends RecipeState {
  final RecipeResponse recipeResponse;

  RecipesLoadSuccess(this.recipeResponse);

  @override
  List<Object> get props => [recipeResponse];
}

class RecipesLoadFail extends RecipeState {
  final String error;

  RecipesLoadFail(this.error);

  @override
  List<Object> get props => [error];
}

class RecipeLoading extends RecipeState {}

class RecipeLoadSuccess extends RecipeState {
  final Recipe recipe;

  RecipeLoadSuccess(this.recipe);

  @override
  List<Object> get props => [recipe];
}

class RecipeLoadFail extends RecipeState {
  final String error;

  RecipeLoadFail(this.error);

  @override
  List<Object> get props => [error];
}

class RecipeCreateSuccess extends RecipeState {}

class RecipeCreateFail extends RecipeState {
  final String error;

  RecipeCreateFail(this.error);

  @override
  List<Object> get props => [error];
}
