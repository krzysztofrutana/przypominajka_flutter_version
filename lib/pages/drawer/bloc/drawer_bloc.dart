import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:przypominajka_flutter/models/eventModel.dart';
import 'package:przypominajka_flutter/pages/add/ui/add.dart';
import 'package:przypominajka_flutter/pages/details/ui/details.dart';
import 'package:przypominajka_flutter/pages/event_list/ui/event_list.dart';
import 'package:przypominajka_flutter/pages/home/ui/home.dart';
import 'package:przypominajka_flutter/pages/settings/ui/settings.dart';
import 'package:przypominajka_flutter/services/NavigatorServices.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerState(NavigationItem.home));


  @override
  Stream<DrawerState> mapEventToState(
      DrawerEvent event,
  ) async* {
    if (event is NavigateTo) {
      // only route to a new location if the new location is different
      switch(event.destination){
        case NavigationItem.home:
          yield DrawerState(event.destination);
          NavigationService.instance.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HomePage()));
          break;
        case NavigationItem.event_list:
          yield DrawerState(event.destination);
          NavigationService.instance.navigateToRoute(MaterialPageRoute(builder: (_) => EventList()));
          break;
        case NavigationItem.settings:
          yield DrawerState(event.destination);
          NavigationService.instance.navigateToRoute(MaterialPageRoute(builder: (_) => Settings()));
          break;
        case NavigationItem.add:
          yield DrawerState(event.destination);
          NavigationService.instance.navigateToRoute(MaterialPageRoute(builder: (_) => AddEvent()));
          break;
        case NavigationItem.details:
          yield DrawerState(event.destination);
          NavigationService.instance.navigateToRoute(MaterialPageRoute(builder: (_) => Details()));
          break;
      }
    }
  }

  @override
  void onTransition(Transition<DrawerEvent, DrawerState> transition) {
    print(transition);
  }

}
