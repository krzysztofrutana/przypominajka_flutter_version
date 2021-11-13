part of 'add_bloc.dart';

abstract class AddState extends Equatable {
  const AddState();
}

class EventNameEmpty extends AddState {
  @override
  List<Object> get props => [];
}

class EventNameIncorrect extends AddState {
  @override
  List<Object> get props => [];
}

class EventNameOK extends AddState {
  @override
  List<Object> get props => [];
}