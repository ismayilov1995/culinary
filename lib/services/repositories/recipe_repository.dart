import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/base/bases.dart';
import 'package:culinary_app/services/repositories/chef_repository.dart';
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
  ChefRepository _chefRepository = ChefRepository();

  @override
  Future<bool> delete(String slug) => _service.delete(slug);

  @override
  Future<Recipe> recipe(String slug) async {
    final recipe = await _service.recipe(slug);
    _chefRepository.cachedChef = recipe.chef;
    return recipe;
  }

  @override
  Future<RecipeResponse> recipes({Filter filter}) =>
      _service.recipes(filter: filter);
}
