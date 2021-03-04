import 'package:bloc/bloc.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/helper/helper.dart';
import 'package:culinary_app/services/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  ChefRepository _chefRepository = ChefRepository();

  void emailChanged(String v) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(v);
    emit(state.copyWith(email: v, emailValid: emailValid));
  }

  void passwordChanged(String v) {
    emit(state.copyWith(password: v, passwordValid: v.length > 6));
  }

  void nameChanged(String v) {
    emit(state.copyWith(name: v, nameValid: v.length > 6));
  }

  void titleChanged(String v) {
    emit(state.copyWith(title: v, titleValid: v.length > 4));
  }

  void phoneChanged(String v) {
    emit(state.copyWith(phone: v));
  }

  void aboutChanged(String v) {
    emit(state.copyWith(about: v, aboutValid: v.length > 20));
  }

  void placeChanged(String v) {
    emit(state.copyWith(place: v));
  }

  void onSubmit() async {
    if (state.email != null &&
        !state.emailValid &&
        !state.passwordValid &&
        !state.nameValid &&
        !state.titleValid &&
        !state.aboutValid) {
      emit(state.copyWith(error: 'Form not valid'));
    }
    emit(state.copyWith(loading: true, error: null));
    try {
      final chef = Chef(
        name: state.name,
        email: state.email,
        phone: state.phone,
        place: state.place,
        title: state.title,
        about: state.about,
        password: state.password,
      );
      await _chefRepository.register(chef);
    } catch (e) {
      emit(state.copyWith(error: HandleError.fetchError(e)));
    } finally {
      emit(state.copyWith(loading: false, error: null));
    }
  }
}
