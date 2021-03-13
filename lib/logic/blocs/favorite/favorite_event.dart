part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class AddRemoveFavorite extends FavoriteEvent {
  AddRemoveFavorite(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class LoadFavorites extends FavoriteEvent {}

class DeleteFavorites extends FavoriteEvent {}
