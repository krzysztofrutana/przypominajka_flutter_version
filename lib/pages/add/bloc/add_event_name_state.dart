part of 'add_event_name_bloc.dart';

enum FieldError { Empty, Invalid}

abstract class AddEventNameState extends Equatable {
  const AddEventNameState();
}

class IsBusy extends AddEventNameState{

@override
  String toString() => 'EventNameField IsBusy';

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IsEmpty extends AddEventNameState{

  @override
  String toString() => 'EventNameField IsEmpty';

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IsIncorrect extends AddEventNameState{

  @override
  String toString() => 'EventNameField IsIncorrect';

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IsOk extends AddEventNameState{

  @override
  String toString() => 'EventNameField IsOk';

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Initialize extends AddEventNameState{

  @override
  String toString() => 'EventNameField Initialize';

  @override
  // TODO: implement props
  List<Object> get props => [];
}
