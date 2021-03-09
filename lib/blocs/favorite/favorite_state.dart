part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class SuccessLoadFavorites extends FavoriteState {
  SuccessLoadFavorites(this.recipeResponse);

  final RecipeResponse recipeResponse;

  @override
  List<Object> get props => [recipeResponse];
}

class AddedFavorite extends FavoriteState {}

class SuccessDeleteFavorites extends FavoriteState {}
