import 'package:culinary_app/services/base/bases.dart';
import 'package:dio/dio.dart';

class DioGlobal {
  Dio dio = Dio(BaseOptions(baseUrl: BaseUrl.releaseUrl + 'api/'));
}
