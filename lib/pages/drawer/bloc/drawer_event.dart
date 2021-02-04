part of 'drawer_bloc.dart';

abstract class DrawerEvent extends Equatable {
  const DrawerEvent();
}

class NavigateTo extends DrawerEvent {
  final NavigationItem destination;
  final Event event;

  const NavigateTo(this.destination, [this.event]);

  @override
  // TODO: implement props
  List<Object> get props => [destination, event];

  @override
  String toString() => "NavigateTo: ${destination.toString()}";
}
