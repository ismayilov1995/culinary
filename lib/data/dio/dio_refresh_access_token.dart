import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class RefreshAccessToken {
  RefreshAccessToken(this.dio);

  final Dio dio;

  Future<Response?> requestRefresh(RequestOptions requestOptions,
      String? refreshToken, ValueChanged<String> onRefreshed) async {
    try {
      final res = await dio
          .post('/auth/refresh', data: {'refresh_token': refreshToken});
      final token = jsonDecode(res.toString())['access_token'];
      onRefreshed(token);
      requestOptions.headers['Authorization'] = 'Bearer: $token';
      final ops = Options(
        method: requestOptions.method,
        sendTimeout: requestOptions.sendTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
        extra: requestOptions.extra,
        headers: requestOptions.headers,
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
        validateStatus: requestOptions.validateStatus,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        followRedirects: requestOptions.followRedirects,
        maxRedirects: requestOptions.maxRedirects,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        listFormat: requestOptions.listFormat,
      );
      return dio.request(
        requestOptions.path,
        options: ops,
        data: requestOptions.data,
        cancelToken: requestOptions.cancelToken,
        queryParameters: requestOptions.queryParameters,
        onReceiveProgress: requestOptions.onReceiveProgress,
        onSendProgress: requestOptions.onSendProgress,
      );
    } catch (_) {
      return null;
    }
  }
}
