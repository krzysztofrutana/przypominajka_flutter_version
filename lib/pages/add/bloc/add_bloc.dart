import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddInitial());

  @override
  Stream<AddState> mapEventToState(
    AddEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
