import 'dart:async';

import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/base/bases.dart';
import 'package:culinary_app/services/restapi/services.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class ChefRepository extends ChefBase {
  ChefRepository._internal();

  static ChefRepository? _chefRepository;

  factory ChefRepository() {
    if (_chefRepository == null) {
      _chefRepository = ChefRepository._internal();
    }
    return _chefRepository!;
  }

  final _controller = StreamController<AuthStatus>();
  final ChefService _service = ChefService();
  final LocalStorage _storage = LocalStorage();

  Stream<AuthStatus> get status async* {
    yield AuthStatus.unknown;
    yield* _controller.stream;
  }

  Future<void> checkAuthenticated() async {
    var user = await currentUser();
    try {
      if (user?.accessToken != null)
        _controller.add(AuthStatus.authenticated);
      else
        _controller.add(AuthStatus.unauthenticated);
    } catch (e) {
      _controller.add(AuthStatus.unauthenticated);
    }
  }

  Future<Auth?> currentUser() async {
    final user = await Future.value(_storage.getAuth());
    return user;
  }

  @override
  Future<Chef?> chef({String? email}) async {
    return await _service.chef(email: email);
  }

  @override
  Future<bool> forgot() {
    // TODO: implement forgot
    throw UnimplementedError();
  }

  @override
  Future<Auth> login(String email, String password) async {
    final auth = await _service.login(email, password);
    await _storage.saveAuth(auth);
    _controller.add(AuthStatus.authenticated);
    return auth;
  }

  @override
  Future<void> logout({bool? fromAll}) async {
    try {
      var token = await _storage.getRefreshToken();
      await _service.logout(fromAll: fromAll, refreshToken: token);
    } finally {
      await _storage.removeAuth();
      _controller.add(AuthStatus.unauthenticated);
    }
  }

  @override
  Future<Auth> register(Chef chef) async {
    final auth = await _service.register(chef);
    await _storage.saveAuth(auth);
    _controller.add(AuthStatus.authenticated);
    return auth;
  }

  void dispose() => _controller.close();
}
