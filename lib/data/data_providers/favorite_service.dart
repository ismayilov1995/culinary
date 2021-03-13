import 'package:culinary_app/data/models/models.dart';
import 'package:culinary_app/data/base/bases.dart';
import 'package:culinary_app/data/dio/dio.dart';
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
    return RecipeResponse.jsonToMap(res.toString());
  }

  @override
  Future<void> delete() async {
    await dio.delete(path);
  }
}
