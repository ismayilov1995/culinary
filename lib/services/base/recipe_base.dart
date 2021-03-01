abstract class RecipeBase {
  Future recipes();

  Future recipe(String slug);

  Future<bool> delete(String slug);
}
