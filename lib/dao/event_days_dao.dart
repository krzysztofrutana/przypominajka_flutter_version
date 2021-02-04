import 'package:flutter/material.dart';
import 'package:przypominajka_flutter/utils//database_provider.dart';
import 'package:przypominajka_flutter/helpers//database_provider_helper.dart';
import 'package:przypominajka_flutter/helpers/datetime_helper.dart';
import 'package:przypominajka_flutter/models/eventModel.dart';

class EventDaysDAO {
  final DatabaseProvider _databaseProvider = DatabaseProvider.db;

  Future<bool> createEventTable(String eventName) async {
    final db = await _databaseProvider.database;
    String createString = '''CREATE TABLE IF NOT EXISTS $eventName(
        ${DatabaseProviderHelper.TEMPLATE_TABLE_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${DatabaseProviderHelper.TEMPLATE_TABLE_DAY_MILLIS} REAL, 
        ${DatabaseProviderHelper.TEMPLATE_TABLE_DAY_STRING} TEXT, 
        ${DatabaseProviderHelper.TEMPLATE_TABLE_EVENT_DONE} INTEGER DEFAULT 0, 
        ${DatabaseProviderHelper.TEMPLATE_TABLE_NOTIFICATION_CREATED} INTEGER DEFAULT 0,
        ${DatabaseProviderHelper.TEMPLATE_TABLE_NOTIFICATION_DISPLAYED} INTEGER DEFAULT 0);''';

    await db.execute(createString);
  }

  Future<int> insertRowToEventDetailTable(
      Map<String, dynamic> map, String eventName) async {
    final db = await _databaseProvider.database;

    var result = await db.insert(eventName, map);

    return result;
  }

  Future fillMonthIntervalTypeEventDetailTable(Event event) async {
    try {
      DateTime dateToInsert;
      DateTime startDate = DateTime.parse(event.startDateString);
      DateTime firstDateWithChoosenDay =
          DateTime(startDate.year, startDate.month, event.monthITDayOfMonth);
      int j = 0;
      if ((startDate.isBefore(firstDateWithChoosenDay) ||
              startDate.isAtSameMomentAs(firstDateWithChoosenDay)) &&
          firstDateWithChoosenDay.isAfter(DateTime.now())) {
        int result = await insertRowToEventDetailTable(<String, dynamic>{
          DatabaseProviderHelper.TEMPLATE_TABLE_DAY_MILLIS:
              firstDateWithChoosenDay.millisecondsSinceEpoch,
          DatabaseProviderHelper.TEMPLATE_TABLE_DAY_STRING:
              firstDateWithChoosenDay.toString(),
        }, event.eventName);
        dateToInsert = firstDateWithChoosenDay;
        if (result == -1) {
          return false;
        }
        j = 1;
      }
      for (int i = j; i < event.monthITQuantityOfRepeats; i++) {
        if (event.monthITDayOfMonth == 31 ||
            (dateToInsert.month + 1 == DateTime.february &&
                event.monthITDayOfMonth > 28)) {
          dateToInsert = DateTime(dateToInsert.year, dateToInsert.month + 2, 0);
        } else {
          dateToInsert = DateTime(dateToInsert.year, dateToInsert.month + 1,
              event.monthITDayOfMonth);
        }
        try {
          int result = await insertRowToEventDetailTable(<String, dynamic>{
            DatabaseProviderHelper.TEMPLATE_TABLE_DAY_MILLIS:
                dateToInsert.millisecondsSinceEpoch,
            DatabaseProviderHelper.TEMPLATE_TABLE_DAY_STRING:
                dateToInsert.toString(),
          }, event.eventName);
          dateToInsert = firstDateWithChoosenDay;
          if (result == -1) {
            return false;
          }
        } catch (e) {
          print(
              "fillMonthIntervalTypeEventDetailTable: Problem z wypełnieniem tabeli " +
                  e.toString());
          return false;
        }
      }
      return true;
    } catch (e) {
      print("fillTableDayOfMonth: " + e.toString());
      return false;
    }
  }

  Future fillCustomTimeIntervalTypeEventTable(Event event) async {
    try {
      DateTime dateToInsert;
      DateTime startDate = DateTime.parse(event.startDateString);
      if (!startDate.isAfter(DateTime.now())) {
        TimeOfDay timeOfEvent =
            TimeOfDay.fromDateTime(DateTime.parse(event.eventTimeString));
        TimeOfDay nowTime = TimeOfDay.now();
        if (DateTimeHelper.getTimeInDouble(timeOfEvent) > DateTimeHelper.getTimeInDouble(nowTime)) {
          dateToInsert = startDate;
        } else {
          dateToInsert =
              DateTime(startDate.year, startDate.month, startDate.day + 1);
        }
      } else {
        dateToInsert = startDate;
      }
      int howManyRepeats;
      if (event.customTimeITRepeatsAllTime) {
        howManyRepeats =
            500; // for now its 500, its big number enough for the one and half year, TODO in future, maybe new service for this in background?
      } else {
        howManyRepeats = event.customTimeITQuantityOfRepeats;
      }
      for (int i = 0; i < howManyRepeats; i++) {
        try {
          int result = await insertRowToEventDetailTable(<String, dynamic>{
            DatabaseProviderHelper.TEMPLATE_TABLE_DAY_MILLIS:
                dateToInsert.millisecondsSinceEpoch,
            DatabaseProviderHelper.TEMPLATE_TABLE_DAY_STRING:
                dateToInsert.toString(),
          }, event.eventName);
          if (result == -1) {
            return false;
          } else {
            {
              if (event.customTimeITType == 1) {
                dateToInsert = DateTime(dateToInsert.year, dateToInsert.month,
                    dateToInsert.day + event.customTimeITTimeInterval);
              } else if (event.customTimeITType == 2) {
                dateToInsert = DateTime(dateToInsert.year, dateToInsert.month,
                    dateToInsert.day + (event.customTimeITTimeInterval * 7));
              } else if (event.customTimeITType == 3) {
                dateToInsert = DateTime(
                    dateToInsert.year,
                    dateToInsert.month + event.customTimeITTimeInterval,
                    dateToInsert.day);
              } else {
                print("fillTableJumpDay: Problem z wypełnieniem tabeli " +
                    event.eventName);
                break;
              }
            }
          }
        } catch (e) {
          print("fillTableJumpDay: Problem z wypełnieniem tabeli " +
              e.toString());
          return false;
        }
      }
      return true;
    } catch (e) {
      print("fillTableJumpDay: " + e.toString());
      return false;
    }
  }
}
