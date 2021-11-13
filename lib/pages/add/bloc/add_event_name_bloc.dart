import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:przypominajka_flutter/models/eventModel.dart';
import 'package:przypominajka_flutter/repositories/event_repositories.dart';
import 'package:rxdart/rxdart.dart';

part 'add_event_name_event.dart';
part 'add_event_name_state.dart';

class AddEventNameBloc extends Bloc<AddEventNameEvent, AddEventNameState>  {
  AddEventNameBloc( this.eventRepositories) : super(Initialize());

  final EventRepositories eventRepositories;

  @override
  Stream<AddEventNameState> mapEventToState(
    AddEventNameEvent event,
  ) async* {
    if (event is EventNameChanged) {
      yield IsBusy();

      if(event.name == null){
        yield Initialize();
        return;
      }

      if (event.name.isEmpty) {
        yield IsEmpty();
        return;
      }

      if (event.name != null && event.name.isNotEmpty) {
        Event checkEvent = await eventRepositories.getEventByName(event.name);
        if(checkEvent != null){
          yield IsIncorrect();
          return;
        }
      }

      yield IsOk();
    }
  }

  @override
  Stream<Transition<AddEventNameEvent, AddEventNameState>> transformEvents(Stream<AddEventNameEvent> events, transitionFn) {
    // TODO: implement transformEvents
    final nonDebounceStream =
    events.where((event) => event is! EventNameChanged);

    final debounceStream =
    events.where((event) => event is EventNameChanged).debounceTime(
      Duration(milliseconds: 1000),
    );

    return super.transformEvents(
        MergeStream([nonDebounceStream, debounceStream]), transitionFn);
  }
  @override
  void onTransition(Transition<AddEventNameEvent, AddEventNameState> transition) {
    print(transition);
  }

}
