import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/base/bases.dart';
import 'package:culinary_app/services/dio/dio.dart';
import 'package:dio/dio.dart';

class FavoriteService extends FavoriteBase {
  Dio dio = DioGlobal().dio;
  final path = 'favorite';

  FavoriteService._internal();

  static FavoriteService? _favoriteService;

  factory FavoriteService() {
    if (_favoriteService == null) {
      _favoriteService = FavoriteService._internal();
    }
    return _favoriteService!;
  }

  @override
  Future<bool> addRemove(String id) async {
    final res = await dio.get(
      '$path/$id',
    );
    return res.statusCode == 200;
  }

  @override
  Future<RecipeResponse> favorites() async {
    final res = await dio.get(path);
    return RecipeResponse.recipeResponseFromMap(res.toString());
  }

  @override
  Future<void> delete() async {
    await dio.delete(path);
  }
}