part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class LoadRecipes extends RecipeEvent {}

class LoadRecipe extends RecipeEvent {
  LoadRecipe(this.slug);

  final String slug;

  @override
  List<Object> get props => [slug];
}
