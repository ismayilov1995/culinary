import 'package:culinary_app/models/models.dart';

abstract class ChefBase {
  Future<Chef?> chef({String? email});
  Future<Chef> login({String? email, String? password});
  Future<Chef> register({Chef? chef});
  Future<Chef> logout({bool? fromAll});
  Future<bool> forgot();
}
