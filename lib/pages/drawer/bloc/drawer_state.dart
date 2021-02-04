part of 'drawer_bloc.dart';

class DrawerState extends Equatable {
  final NavigationItem selectedItem;

  const DrawerState(this.selectedItem) : super();

  @override
  List<Object> get props => [selectedItem];

  @override
  String toString() => 'DrawerState_current: ${selectedItem.toString()}';
}

enum NavigationItem {
  home,
  event_list,
  settings,
  add,
  details
}