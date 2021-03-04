part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState(
      {this.name,
      this.email,
      this.phone,
      this.password,
      this.place,
      this.title,
      this.about,
      this.nameValid = true,
      this.emailValid = true,
      this.passwordValid = true,
      this.titleValid = true,
      this.aboutValid = true,
      this.loading = false,
      this.error});

  final String? name, email, phone, password, place, title, about, error;
  final bool nameValid,
      emailValid,
      passwordValid,
      titleValid,
      aboutValid,
      loading;

  RegisterState copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    String? place,
    String? title,
    String? about,
    bool? nameValid,
    bool? emailValid,
    bool? passwordValid,
    bool? titleValid,
    bool? aboutValid,
    bool? loading,
    String? error,
  }) =>
      RegisterState(
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        place: place ?? this.place,
        title: title ?? this.title,
        about: about ?? this.about,
        nameValid: nameValid ?? this.nameValid,
        emailValid: emailValid ?? this.emailValid,
        passwordValid: passwordValid ?? this.passwordValid,
        titleValid: titleValid ?? this.titleValid,
        aboutValid: aboutValid ?? this.aboutValid,
        loading: loading ?? this.loading,
        error: error,
      );

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        password,
        place,
        title,
        about,
        nameValid,
        emailValid,
        passwordValid,
        titleValid,
        aboutValid,
        loading,
        error,
      ];
}
