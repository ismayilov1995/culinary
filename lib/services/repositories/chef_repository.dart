import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/base/bases.dart';
import 'package:culinary_app/services/restapi/services.dart';

class ChefRepository extends ChefBase {
  ChefRepository._internal();

  static ChefRepository _chefRepository;

  factory ChefRepository() {
    if (_chefRepository == null) {
      _chefRepository = ChefRepository._internal();
    }
    return _chefRepository;
  }

  ChefService _service = ChefService();

  Chef cachedChef;

  @override
  Future<Chef> chef({String email}) async {
    if (cachedChef == null) {
      cachedChef = await _service.chef(email: email);
    }
    return cachedChef;
  }
}
