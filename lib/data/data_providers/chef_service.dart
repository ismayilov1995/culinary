import 'dart:convert';

import 'package:culinary_app/data/base/bases.dart';
import 'package:culinary_app/data/dio/dio.dart';
import 'package:culinary_app/data/models/models.dart';
import 'package:dio/dio.dart';

class ChefService extends ChefBase {
  Dio dio = DioGlobal().dio;
  final path = 'user';

  ChefService._internal();

  static ChefService? _chefService;

  factory ChefService() {
    if (_chefService == null) {
      _chefService = ChefService._internal();
    }
    return _chefService!;
  }

  @override
  Future<Chef> chef(String email) async {
    final res = await dio.get('$path/profile/$email');
    return Chef.fromMap(jsonDecode(res.toString())['chef']);
  }

  @override
  Future<bool> forgot() {
    // TODO: implement forgot
    throw UnimplementedError();
  }

  @override
  Future<Auth> login(String email, String password) async {
    final res = await dio
        .post('auth/login', data: {'email': email, 'password': password});
    return Auth.authFromMap(res.toString());
  }

  @override
  Future<void> logout({bool? fromAll = false, String? refreshToken}) async {
    if (fromAll!)
      await dio.delete('auth/logout');
    else
      await dio.post('auth/logout', data: {'refresh_token': refreshToken});
  }


  @override
  Future<Auth> register(Chef chef) async {
    final res = await dio.post('auth/register', data: chef.toMapForRegister());
    return Auth.authFromMap(res.toString());
  }
}
