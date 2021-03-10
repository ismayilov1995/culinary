import 'package:culinary_app/blocs/auth/authentication_bloc.dart';
import 'package:culinary_app/services/restapi/services.dart';
import 'package:dio/dio.dart';

import 'dio_refresh_access_token.dart';

class CulinaryInterceptor extends Interceptor {
  CulinaryInterceptor(this.refreshAccessToken);

  final RefreshAccessToken refreshAccessToken;
  LocalStorage _localStorage = LocalStorage();
  bool tokenRefreshed = false;

  @override
  Future onRequest(RequestOptions options) async {
    final token = await _localStorage.getAccessToken();
    options.headers.addAll({'Authorization': 'Bearer: $token'});
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    tokenRefreshed = false;
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    if (err.type == DioErrorType.other ||
        err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      print("Connection timeout " + err.toString());
    } else if (err.response?.statusCode == 403) {
      tokenRefreshed = false;
      if (tokenRefreshed = true) {
        AuthenticationBloc().add(AutClearAndUnauthenticated());
      }
    } else if (err.response?.statusCode == 401 && !tokenRefreshed) {
      try {
        tokenRefreshed = true;
        final refreshToken = await _localStorage.getRefreshToken();
        return refreshAccessToken.requestRefresh(err.request!, refreshToken,
            (token) async {
          await _localStorage.updateAccessToken(token);
        });
      } catch (e) {
        return e;
      }
    }
    return super.onError(err);
  }
}
