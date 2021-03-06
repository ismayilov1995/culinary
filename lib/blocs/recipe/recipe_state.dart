part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeInitial extends RecipeState {}

class SuccessLoadRecipes extends RecipeState {
  SuccessLoadRecipes(this.recipeResponse);

  final RecipeResponse recipeResponse;

  @override
  List<Object> get props => [recipeResponse];
}

class FailLoadRecipes extends RecipeState {
  FailLoadRecipes(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

class SuccessLoadRecipe extends RecipeState {
  SuccessLoadRecipe(this.recipe);

  final Recipe recipe;

  @override
  List<Object> get props => [recipe];
}

class FailLoadRecipe extends RecipeState {
  FailLoadRecipe(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
