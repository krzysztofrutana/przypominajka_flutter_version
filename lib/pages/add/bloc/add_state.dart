part of 'add_bloc.dart';

abstract class AddState extends Equatable {
  const AddState();
}

class AddInitial extends AddState {
  @override
  List<Object> get props => [];
}
