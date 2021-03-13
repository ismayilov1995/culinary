part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthStatusChanged extends AuthenticationEvent {
  const AuthStatusChanged(this.status);

  final AuthStatus status;

  @override
  List<Object?> get props => [status];
}

class AuthLogoutRequested extends AuthenticationEvent {
  const AuthLogoutRequested({this.logOutAll = false});

  final bool logOutAll;

  @override
  List<Object> get props => [logOutAll];
}

class AutClearAndUnauthenticated extends AuthenticationEvent {}
