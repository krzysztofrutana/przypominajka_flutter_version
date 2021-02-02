import 'package:przypominajka_flutter/database/dao/event_dao.dart';
import 'package:przypominajka_flutter/database/dao/event_days_dao.dart';
import 'package:przypominajka_flutter/database/models/eventModel.dart';


class EventRepositories{

  final eventDAO = EventDAO();
  final eventDaysDAO = EventDaysDAO();

  Future getAllEvents() => eventDAO.getAllEvents();

  Future getEventByName(String name) => eventDAO.getEventByName(name);

  Future getEventId(String name) => eventDAO.getEventId(name);

  Future updateEvent(Event event) => eventDAO.updateEvent(event);

  Future deleteEventByID(int id) => eventDAO.deleteEventByID(id);

  Future deleteEventByName(String name) => eventDAO.deleteEventByName(name);

  Future insertEvent(Event event) async {
    try {
      eventDAO.insertEvent(event);
      eventDaysDAO.createEventTable(event.eventName)
      if (event.itsMonthIT) {
        eventDaysDAO.fillMonthIntervalTypeEventDetailTable(event);
      } else if (event.itsCustomTimeIT) {
        eventDaysDAO.fillCustomTimeIntervalTypeEventTable(event);
      }
    }catch(e){
      print(e.toString());
    }
  }
}