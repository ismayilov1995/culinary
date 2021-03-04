import 'dart:convert';

import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/base/bases.dart';
import 'package:culinary_app/services/dio/dio.dart';
import 'package:dio/dio.dart';

class RecipeService extends RecipeBase {
  Dio dio = DioGlobal().dio;
  final path = 'recipe';

  RecipeService._internal();

  static RecipeService? _recipeService;

  factory RecipeService() {
    if (_recipeService == null) {
      _recipeService = RecipeService._internal();
    }
    return _recipeService!;
  }

  @override
  Future<bool?> delete(String slug) async {
    final res = await dio.delete('$path/detail/$slug');
    return jsonDecode(res.toString())['message'];
  }

  @override
  Future<Recipe> recipe(String? slug) async {
    final res = await dio.get('$path/detail/$slug');
    return Recipe.fromJSON(res.toString());
  }

  @override
  Future<RecipeResponse> recipes({Filter? filter}) async {
    Map<String, dynamic> query = Map();
    if (filter != null) query = filter.toMap();
    final res = await dio.get(path, queryParameters: query);
    return RecipeResponse.recipeResponseFromMap(res.toString());
  }
}
