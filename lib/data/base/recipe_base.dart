import 'package:culinary_app/data/models/models.dart';

abstract class RecipeBase {
  Future<RecipeResponse> recipes({Filter? filter});

  Future<Recipe> recipe(String slug);

  Future<bool?> delete(String slug);

  Future<bool> create(Recipe recipe);

  Future<void> check();
}
