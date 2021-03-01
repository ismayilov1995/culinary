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
  Future<bool> delete(String slug) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future recipe(String slug) {
    // TODO: implement recipe
    throw UnimplementedError();
  }

  @override
  Future recipes() => _service.recipes();
}
