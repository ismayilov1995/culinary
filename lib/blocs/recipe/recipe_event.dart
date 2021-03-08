part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object?> get props => [];
}

class LoadRecipes extends RecipeEvent {
  LoadRecipes({this.filter});

  final Filter? filter;

  @override
  List<Object?> get props => [filter];
}

class LoadRecipe extends RecipeEvent {
  LoadRecipe(this.slug);

  final String? slug;

  @override
  List<Object?> get props => [slug];
}

class LoadChefsRecipes extends RecipeEvent {
  LoadChefsRecipes(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class CreateRecipe extends RecipeEvent {
  CreateRecipe(this.recipe);

  final Recipe recipe;

  @override
  List<Object?> get props => [recipe];
}

class Check extends RecipeEvent {}
