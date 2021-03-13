part of 'chef_cubit.dart';

abstract class ChefState extends Equatable {
  const ChefState();

  @override
  List<Object> get props => [];
}

class ChefInitial extends ChefState {}

class ChefLoadSuccess extends ChefState {
  final Chef chef;

  ChefLoadSuccess(this.chef);

  @override
  List<Object> get props => [chef];
}

class ChefLoadFail extends ChefState {
  final String error;

  ChefLoadFail(this.error);

  @override
  List<Object> get props => [error];
}
