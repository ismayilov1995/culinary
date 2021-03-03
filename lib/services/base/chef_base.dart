import 'package:culinary_app/models/models.dart';

abstract class ChefBase {
  Future<Chef> chef({String email});
}
