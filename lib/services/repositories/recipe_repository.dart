import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/base/bases.dart';
import 'package:culinary_app/services/restapi/services.dart';

class RecipeRepository extends RecipeBase {
  RecipeRepository._internal();

  static RecipeRepository _recipeRepository;

  factory RecipeRepository() {
    if (_recipeRepository == null) {
      _recipeRepository = RecipeRepository._internal();
    }
    return _recipeRepository;
  }

  RecipeService _service = RecipeService();

  @override
  Future<bool> delete(String slug) => _service.delete(slug);

  @override
  Future<Recipe> recipe(String slug) => _service.recipe(slug);

  @override
  Future<RecipeResponse> recipes() => _service.recipes();
}
