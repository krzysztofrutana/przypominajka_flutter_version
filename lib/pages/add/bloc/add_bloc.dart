import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:przypominajka_flutter/models/eventModel.dart';
import 'package:przypominajka_flutter/pages/add/ui/add.dart';
import 'package:przypominajka_flutter/repositories/event_repositories.dart';
import 'package:rxdart/rxdart.dart';


part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {

  final EventRepositories eventRepositories;

  // AddBloc(
  //     {@required this.eventRepositories}) {
  //   addEditBlocSubscription = songAddEditBloc.listen((songAddEditState) {
  //     if (state is SearchStateSuccess) {
  //       if (songAddEditState is EditSongStateSuccess) {
  //         add(SongUpdated(song: songAddEditState.song));
  //       } else if (songAddEditState is AddSongStateSuccess) {
  //         add(SongAdded(song: songAddEditState.song));
  //       }
  //     }
  //   });
  // }

  AddBloc(@required this.eventRepositories) :super(EventNameEmpty());


  @override
  Stream<AddState> mapEventToState(
    AddEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }

    @override
    Stream<Transition<AddEvent, AddState>> transformEvents(Stream<AddEvent> events,
        TransitionFunction<AddEvent, AddState> transitionFn) {
      final nonDebounceStream =
      events.where((event) => event is! EventNameTextChanged);

      final debounceStream =
      events.where((event) => event is EventNameTextChanged).debounceTime(
        Duration(milliseconds: 500),
      );

      return super.transformEvents(
          MergeStream([nonDebounceStream, debounceStream]), transitionFn);
    }
}
