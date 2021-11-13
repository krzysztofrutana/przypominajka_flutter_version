import 'package:przypominajka_flutter/models/eventModel.dart';
import 'package:przypominajka_flutter/repositories/event_repositories.dart';

import 'dart:async';

class EventBloc {
  final _eventRepository = EventRepositories();

  final _eventController = StreamController<List<Event>>.broadcast();

  get events => _eventController.stream;

  EventBloc() {
    getEvents();
  }

  getEvents() async {
    _eventController.sink.add(await _eventRepository.getAllEvents());
  }

  getEventByName(String name) async {
    _eventController.sink.add(await _eventRepository.getEventByName(name));
  }

  getEventId(String name) async {
    _eventController.sink.add(await _eventRepository.getEventId(name));
  }

  addEvent(Event event) async {
    await _eventRepository.insertEvent(event);
    getEvents();
  }

  updateEvent(Event event) async {
    await _eventRepository.updateEvent(event);
    getEvents();
  }

  deleteEventById(int id) async {
    await _eventRepository.deleteEventByID(id);
    getEvents();
  }

  deleteEventByName(String name) async {
    await _eventRepository.deleteEventByName(name);
    getEvents();
  }

  dispose() {
    _eventController.close();
  }
}