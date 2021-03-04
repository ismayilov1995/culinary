import 'package:culinary_app/models/models.dart';

import 'dart:convert';

class Auth {
  static Auth authFromMap(String str) => Auth.fromMap(json.decode(str));

  static String authToMap(Auth data) => json.encode(data.toMap());

  Auth({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  String accessToken;
  String refreshToken;
  Chef user;

  factory Auth.fromMap(Map<String, dynamic> json) => Auth(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        user: Chef.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "user": user.toMap(),
      };
}
