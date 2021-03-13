import 'package:bloc/bloc.dart';
import 'package:culinary_app/data/models/models.dart';
import 'package:culinary_app/data/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _favoriteRepository = FavoriteRepository();

  FavoriteCubit() : super(FavoriteInitial());

  Future<void> favorites(String chefID) async {
    try {
      final res = await _favoriteRepository.favorites(chefID);
      emit(FavoriteLoadSuccess(res));
    } catch (e) {
      emit(FavoriteLoadFail());
    }
  }

  Future<void> addFavorite(String recipeID) async {
    try {
      final res = await _favoriteRepository.addRemove(recipeID);
      emit(FavoriteAdded(res));
    } catch (e) {
      print(e);
    }
    emit(FavoriteInitial());
  }
}
