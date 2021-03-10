import 'package:bloc/bloc.dart';
import 'package:culinary_app/services/helper/helper.dart';
import 'package:culinary_app/services/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  ChefRepository _repository = ChefRepository();

  void emailChanged(String v) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(v);
    emit(state.copyWith(email: v, emailValid: emailValid));
  }

  void passwordChanged(String v) {
    emit(state.copyWith(password: v, passwordValid: v.length > 6));
  }

  void logIn() async {
    bool formValid =
        state.email != null && state.emailValid && state.passwordValid;
    if (!formValid) {
      emit(state.copyWith(error: 'Fill fields'));
      return;
    }
    emit(state.copyWith(loading: true));
    try {
      await _repository.login(state.email!, state.password!);
    } catch (e) {
      emit(state.copyWith(error: HandleError.fetchError(e)));
    } finally {
      emit(state.copyWith(loading: false, error: null));
    }
  }
}
