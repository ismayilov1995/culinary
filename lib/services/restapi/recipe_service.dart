import 'package:culinary_app/services/base/bases.dart';
import 'package:culinary_app/services/dio/dio.dart';
import 'package:dio/dio.dart';

class RecipeService extends RecipeBase {
  Dio dio = DioGlobal().dio;
  final path = 'recipe';

  RecipeService._internal();

  static RecipeService _recipeService;

  factory RecipeService() {
    if (_recipeService == null) {
      _recipeService = RecipeService._internal();
    }
    return _recipeService;
  }

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
  Future recipes() async {
    final res = await dio.get(path);
    print(res);
  }
}
