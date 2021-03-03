import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'chef_event.dart';

part 'chef_state.dart';

class ChefBloc extends Bloc<ChefEvent, ChefState> {
  ChefBloc() : super(ChefInitial());

  ChefRepository _repository = ChefRepository();

  @override
  Stream<ChefState> mapEventToState(
    ChefEvent event,
  ) async* {
    if (event is LoadChef) {
      yield* _mapLoadChef(event);
    }
  }

  Stream<ChefState> _mapLoadChef(LoadChef event) async* {
    try {
      final chef = await _repository.chef(email: event.email);
      yield SuccessLoadChef(chef);
    } catch (e) {
      print(e);
      yield FailLoadChef('error while load');
    }
  }
}
