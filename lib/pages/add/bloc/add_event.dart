part of 'add_bloc.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();
}

class EventNameTextChanged extends AddEvent {
  final String query;

  EventNameTextChanged({this.query});

  @override
  String toString() => "EventNameTextChanged { query: $query }";

  @override
  // TODO: implement props
  List<Object> get props => [query];
}
