part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({this.status = AuthStatus.unknown, this.auth});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(Auth auth)
      : this._(status: AuthStatus.authenticated, auth: auth);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  final AuthStatus status;
  final Auth? auth;

  @override
  List<Object?> get props => [status, auth];
}
