part of 'chef_bloc.dart';

abstract class ChefState extends Equatable {
  const ChefState();

  @override
  List<Object> get props => [];
}

class ChefInitial extends ChefState {}

class SuccessLoadChef extends ChefState {
  SuccessLoadChef(this.chef);

  final Chef chef;

  @override
  List<Object> get props => [chef];
}

class FailLoadChef extends ChefState {
  FailLoadChef(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
