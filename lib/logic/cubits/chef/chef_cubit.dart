import 'package:bloc/bloc.dart';
import 'package:culinary_app/core/exceptions/handle_error_messages.dart';
import 'package:culinary_app/data/models/models.dart';
import 'package:culinary_app/data/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'chef_state.dart';

class ChefCubit extends Cubit<ChefState> {
  final ChefRepository _chefRepository = ChefRepository();

  ChefCubit() : super(ChefInitial());

  Future<void> load(String email) async {
    try {
      final chef = await _chefRepository.chef(email);
      emit(ChefLoadSuccess(chef));
    } catch (e) {
      emit(ChefLoadFail(HandleError.fetchError(e)));
    }
  }
}
