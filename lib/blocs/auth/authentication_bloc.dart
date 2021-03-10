import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc._internal() : super(const AuthenticationState.unknown()) {
    _chefRepository.checkAuthenticated();
    _subscription =
        _chefRepository.status.listen((s) => add(AuthStatusChanged(s)));
  }

  // ignore: close_sinks
  static AuthenticationBloc? _authenticationBloc;

  factory AuthenticationBloc() {
    if (_authenticationBloc == null)
      _authenticationBloc = AuthenticationBloc._internal();
    return _authenticationBloc!;
  }

  ChefRepository _chefRepository = ChefRepository();
  StreamSubscription<AuthStatus>? _subscription;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthStatusChanged) {
      yield await _mapAuthStatusChangedToState(event);
    } else if (event is AuthLogoutRequested) {
      _chefRepository.logout(fromAll: event.logOutAll);
    } else if (event is AutClearAndUnauthenticated) {
      _chefRepository.clear();
    }
  }

  Future<AuthenticationState> _mapAuthStatusChangedToState(
    AuthStatusChanged event,
  ) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        return const AuthenticationState.unauthenticated();
      case AuthStatus.authenticated:
        final auth = await _tryGetAuthData();
        return auth != null
            ? AuthenticationState.authenticated(auth)
            : const AuthenticationState.unauthenticated();
      default:
        return const AuthenticationState.unknown();
    }
  }

  Future<Auth?> _tryGetAuthData() async {
    return await _chefRepository.currentUser();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _chefRepository.dispose();
    return super.close();
  }
}
