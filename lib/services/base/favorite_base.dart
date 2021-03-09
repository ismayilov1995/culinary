import 'package:culinary_app/models/models.dart';

abstract class FavoriteBase {
  Future<RecipeResponse> favorites();

  Future<bool> addRemove(String id);

  Future<void> delete();
}
