import 'package:culinary_app/services/base/bases.dart';
import 'package:dio/dio.dart';

class DioGlobal {
  Dio dio = Dio(BaseOptions(baseUrl: BaseUrl.releaseUrl + 'api/'));
  static DioGlobal _dioGlobal;

  DioGlobal._internal();

  factory DioGlobal() {
    if (_dioGlobal == null) {
      _dioGlobal = DioGlobal._internal();
    }
    return _dioGlobal;
  }
}
