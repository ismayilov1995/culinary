import 'package:culinary_app/data/base/bases.dart';
import 'package:culinary_app/data/models/models.dart';
import 'package:culinary_app/data/data_providers/data_provider.dart';

class FavoriteRepository extends FavoriteBase {
  FavoriteRepository._internal();

  static FavoriteRepository? _favoriteRepository;

  factory FavoriteRepository() {
    if (_favoriteRepository == null) {
      _favoriteRepository = FavoriteRepository._internal();
    }
    return _favoriteRepository!;
  }

  FavoriteService _favoriteService = FavoriteService();

  @override
  Future<bool> addRemove(String id) => _favoriteService.addRemove(id);

  @override
  Future<void> delete() => _favoriteService.delete();

  @override
  Future<RecipeResponse> favorites() => _favoriteService.favorites();
}
