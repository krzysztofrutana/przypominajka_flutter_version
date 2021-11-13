part of 'add_event_name_bloc.dart';

abstract class AddEventNameEvent extends Equatable {
  const AddEventNameEvent();
}

class EventNameChanged extends AddEventNameEvent {
  final String name;
  EventNameChanged(this.name);

  @override
  // TODO: implement props
  List<Object> get props => [name];

  @override
  String toString() => "NavigateTo: ${name}";
}
