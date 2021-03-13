import 'dart:async';

import 'package:culinary_app/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._internal();

  static LocalStorage? _storage;

  factory LocalStorage() {
    if (_storage == null) {
      _storage = LocalStorage._internal();
    }
    return _storage!;
  }

  Future<SharedPreferences> _preferences = SharedPreferences.getInstance();

  Future<bool> saveAuth(Auth auth) async {
    final prefs = await _preferences;
    try {
      await prefs.setString('id', auth.user.id!);
      await prefs.setString('name', auth.user.name!);
      await prefs.setString('email', auth.user.email!);
      await prefs.setString('image', auth.user.image!);
      await prefs.setString('role', auth.user.role!);
      await prefs.setString('token', auth.accessToken);
      await prefs.setString('refresh', auth.refreshToken);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Auth?> getAuth() async {
    final SharedPreferences prefs = await _preferences;
    try {
      return Auth(
          accessToken: prefs.getString('token')!,
          refreshToken: prefs.getString('refresh')!,
          user: Chef(
            id: prefs.getString('id'),
            name: prefs.getString('name'),
            email: prefs.getString('email'),
            image: prefs.getString('image'),
            role: prefs.getString('role'),
          ));
    } catch (_) {
      return null;
    }
  }

  Future<bool> updateAccessToken(String token) async {
    final prefs = await _preferences;
    try {
      await prefs.setString('token', token);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String?> getRefreshToken() async {
    final prefs = await _preferences;
    try {
      return prefs.getString('refresh')!;
    } catch (_) {
      return null;
    }
  }

  Future<String?> getAccessToken() async {
    final prefs = await _preferences;
    try {
      return prefs.getString('token')!;
    } catch (_) {
      return null;
    }
  }

  Future<bool> removeAuth() async {
    final prefs = await _preferences;
    try {
      await prefs.clear();
      return true;
    } catch (_) {
      return false;
    }
  }
}
