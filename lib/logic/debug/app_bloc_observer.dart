import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  void onCreate(Bloc bloc) {
    print(bloc);
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }
}
