import 'package:culinary_app/models/models.dart';

abstract class RecipeBase {
  Future<RecipeResponse> recipes();

  Future<Recipe> recipe(String slug);

  Future<bool> delete(String slug);
}
