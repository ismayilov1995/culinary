import 'package:culinary_app/models/models.dart';

abstract class ChefBase {
  Future<Chef?> chef({String? email});

  Future<Auth> login(String email, String password);

  Future<Auth> register(Chef chef);

  Future<void> logout({bool? fromAll});

  Future<bool> forgot();
}
