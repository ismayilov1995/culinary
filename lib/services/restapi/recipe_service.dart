import 'dart:convert';
import 'dart:math';

import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/base/bases.dart';
import 'package:culinary_app/services/dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

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

  @override
  Future<bool> create(Recipe recipe) async {
    var rMap = recipe.toMapForCreate();
    var images = [];
    if (recipe.imageCreate != null) {
      recipe.imageCreate?.forEach((e) async {
        String filename = e.path.split('/').last;
        String ext = filename.split('.').last;
        var a = await MultipartFile.fromFile(e.path,
            filename: filename, contentType: MediaType('image', ext));
        images.add(a);
      });
    }
    FormData formData = FormData.fromMap(rMap);
    await dio.post(path + '/create', data: formData);
    return Future.value(true);
  }
}
