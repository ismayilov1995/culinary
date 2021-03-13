part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteAdded extends FavoriteState {
  final bool added;

  FavoriteAdded(this.added);

  @override
  List<Object> get props => [added];
}

class FavoriteLoadSuccess extends FavoriteState {
  final RecipeResponse recipeResponse;

  FavoriteLoadSuccess(this.recipeResponse);

  @override
  List<Object> get props => [recipeResponse];
}

class FavoriteLoadFail extends FavoriteState {}
