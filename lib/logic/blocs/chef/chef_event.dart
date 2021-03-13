part of 'chef_bloc.dart';

abstract class ChefEvent extends Equatable {
  const ChefEvent();

  @override
  List<Object?> get props => [];
}


class LoadChef extends ChefEvent {
  LoadChef({this.email});

  final String? email;

  @override
  List<Object?> get props => [email];
}
