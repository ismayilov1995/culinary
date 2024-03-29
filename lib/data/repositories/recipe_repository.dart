import 'package:culinary_app/data/base/bases.dart';
import 'package:culinary_app/data/models/models.dart';
import 'package:culinary_app/data/data_providers/data_provider.dart';

class RecipeRepository extends RecipeBase {
  RecipeRepository._internal();

  static RecipeRepository? _recipeRepository;

  factory RecipeRepository() {
    if (_recipeRepository == null) {
      _recipeRepository = RecipeRepository._internal();
    }
    return _recipeRepository!;
  }

  RecipeService _service = RecipeService();

  @override
  Future<bool?> delete(String slug) => _service.delete(slug);

  @override
  Future<Recipe> recipe(String? slug) async {
    final recipe = await _service.recipe(slug);
    return recipe;
  }

  @override
  Future<RecipeResponse> recipes({Filter? filter}) =>
      _service.recipes(filter: filter);

  @override
  Future<bool> create(Recipe recipe) {
    return _service.create(recipe);
  }

  @override
  Future<void> check() => _service.check();
}
