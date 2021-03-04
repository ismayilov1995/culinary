import 'package:culinary_app/services/base/bases.dart';
import 'package:dio/dio.dart';
import 'dio_interceptor.dart';
import 'dio_refresh_access_token.dart';

class DioGlobal {
  static DioGlobal? _dioGlobal;

  DioGlobal._internal() {
    dio.interceptors.add(CulinaryInterceptor(RefreshAccessToken(dio)));
  }

  factory DioGlobal() {
    if (_dioGlobal == null) {
      _dioGlobal = DioGlobal._internal();
    }
    return _dioGlobal!;
  }

  Dio dio = Dio(BaseOptions(baseUrl: BaseUrl.restUrl + 'api/'));
}
