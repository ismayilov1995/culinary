import 'package:culinary_app/data/models/models.dart';

abstract class FavoriteBase {
  Future<RecipeResponse> favorites(String id);

  Future<bool> addRemove(String id);

  Future<void> delete();
}
