import 'package:przypominajka_flutter/models/eventModel.dart';
import 'package:przypominajka_flutter/utils/database_provider.dart';
import 'package:przypominajka_flutter/helpers//database_provider_helper.dart';

class EventDAO {
  final DatabaseProvider _databaseProvider = DatabaseProvider.db;


  Future<List<Event>> getAllEvents() async {
    final db = await _databaseProvider.database;

    var events =
        await db.query(DatabaseProviderHelper.TABLE_EVENTS, columns: DatabaseProviderHelper.EVENT_TABLE_COLUMN);
    List<Event> eventList = List<Event>();

    events.forEach((element) {
      Event event = Event.fromMap(element);
      eventList.add(event);
    });
    return eventList;
  }

  Future<Event> getEventByName(String name) async {
    final db = await _databaseProvider.database;

    List<Map<String, dynamic>> result;
    if (name != null) {
      if (name.isNotEmpty)
        result = await db.query(DatabaseProviderHelper.TABLE_EVENTS,
            columns: DatabaseProviderHelper.EVENT_TABLE_COLUMN,
            where: '${DatabaseProviderHelper.EVENT_NAME} LIKE ?',
            whereArgs: [name]);
      Event event = Event.fromMap(result.first);
      return event;
    } else {
      return null;
    }
  }

  Future<int> getEventId(String name) async {
    final db = await _databaseProvider.database;

    List<Map<String, dynamic>> result;
    if (name != null) {
      if (name.isNotEmpty)
        result = await db.query(DatabaseProviderHelper.TABLE_EVENTS,
            columns: DatabaseProviderHelper.EVENT_TABLE_COLUMN,
            where: '${DatabaseProviderHelper.EVENT_NAME} LIKE ?',
            whereArgs: [name]);
      Event event = Event.fromMap(result.first);
      return event.id;
    } else {
      return -1;
    }
  }

  Future<int> updateEvent(Event event) async {
    final db = await _databaseProvider.database;

    var result = await db.update(DatabaseProviderHelper.TABLE_EVENTS, event.toMap(),
        where: "${DatabaseProviderHelper.EVENT_ID} = ?", whereArgs: [event.id]);

    return result;
  }

  Future<int> deleteEventByID(int id) async {
    final db = await _databaseProvider.database;

    var result = await db.delete(DatabaseProviderHelper.TABLE_EVENTS,
        where: "${DatabaseProviderHelper.EVENT_ID} = ?", whereArgs: [id]);

    return result;
  }

  Future<int> deleteEventByName(String name) async {
    final db = await _databaseProvider.database;

    var result = await db.delete(DatabaseProviderHelper.TABLE_EVENTS,
        where: "${DatabaseProviderHelper.EVENT_NAME} = ?", whereArgs: [name]);

    return result;
  }

  Future<int> insertEvent(Event event) async {
    final db = await _databaseProvider.database;

    event.id = await db.insert(DatabaseProviderHelper.TABLE_EVENTS, event.toMap());

    return event.id;
  }
}
