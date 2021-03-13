part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email,
    this.password,
    this.error,
    this.emailValid = true,
    this.passwordValid = true,
    this.loading = false,
  });

  final String? email, password, error;
  final bool emailValid, passwordValid, loading;

  LoginState copyWith({
    String? email,
    String? password,
    String? error,
    bool? emailValid,
    bool? passwordValid,
    bool? loading,
  }) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        error: error,
        emailValid: emailValid ?? this.emailValid,
        passwordValid: passwordValid ?? this.passwordValid,
        loading: loading ?? this.loading,
      );

  @override
  List<Object?> get props =>
      [email, password, error, emailValid, passwordValid, loading];
}
