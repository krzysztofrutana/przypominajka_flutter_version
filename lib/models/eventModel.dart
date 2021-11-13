import 'package:przypominajka_flutter/helpers//database_provider_helper.dart';


class Event {
  int id;
  String eventName;
  String eventDiscription;
  int eventColorNumber;
  bool itsMonthIT;
  int monthITQuantityOfRepeats;
  int monthITDayOfMonth;
  bool itsCustomTimeIT;
  int customTimeITType;
  bool customTimeITRepeatsAllTime;
  int customTimeITQuantityOfRepeats;
  int customTimeITTimeInterval;
  bool itsOneTimeType;
  int oneTimeTypeDate;
  int startDateMillis;
  String startDateString;
  bool itsEventDefaultTime;
  int eventTimeMillis;
  String eventTimeString;

  Event(
      {this.id, this.eventName, this.eventDiscription, this.eventColorNumber, this.itsMonthIT,
        this.monthITQuantityOfRepeats, this.monthITDayOfMonth, this.itsCustomTimeIT, this.customTimeITType,
        this.customTimeITRepeatsAllTime, this.customTimeITQuantityOfRepeats, this.customTimeITTimeInterval,
        this.itsOneTimeType, this.oneTimeTypeDate, this.startDateMillis, this.startDateString, this.itsEventDefaultTime, this.eventTimeMillis, this.eventTimeString});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProviderHelper.EVENT_NAME: eventName,
      DatabaseProviderHelper.EVENT_DISCRIPTION: eventDiscription,
      DatabaseProviderHelper.EVENT_COLOR_NUMBER: eventColorNumber,
      DatabaseProviderHelper.ITS_MONTH_IT: itsMonthIT ? 1 : 0,
      DatabaseProviderHelper
          .MONTH_IT_QUANTITY_OF_REPEATS: monthITQuantityOfRepeats,
      DatabaseProviderHelper.MONTH_IT_DAY_OF_MONTH: monthITDayOfMonth,
      DatabaseProviderHelper.ITS_CUSTOM_TI: itsCustomTimeIT ? 1 : 0,
      DatabaseProviderHelper.CUSTOM_TIME_IT_TYPE: customTimeITType,
      DatabaseProviderHelper
          .CUSTOM_TIME_IT_REPEATS_ALL_TIME: customTimeITRepeatsAllTime,
      DatabaseProviderHelper
          .CUSTOM_TIME_IT_QUANTITY_OF_REPEATS: customTimeITQuantityOfRepeats,
      DatabaseProviderHelper
          .CUSTOM_TIME_IT_TIME_INTERVAL: customTimeITTimeInterval,
      DatabaseProviderHelper.ITS_ONE_TIME_TYPE: itsOneTimeType ? 1 : 0,
      DatabaseProviderHelper.ONE_TIME_TYPE_DATE: oneTimeTypeDate,
      DatabaseProviderHelper.START_DATE_MILLIS: startDateMillis,
      DatabaseProviderHelper.START_DATE_STRING: startDateString,
      DatabaseProviderHelper.ITS_EVENT_DEFAULT_TIME: itsEventDefaultTime
          ? 1
          : 0,
      DatabaseProviderHelper.EVENT_TIME_MILLIS: eventTimeMillis,
      DatabaseProviderHelper.EVENT_TIME_STRING: eventTimeString
    };

    if (id != null) {
      map[DatabaseProviderHelper.EVENT_ID] = id;
    }

    return map;
  }

  Event.fromMap(Map<String, dynamic> map){
      id = map[DatabaseProviderHelper.EVENT_ID];
      eventName = map[DatabaseProviderHelper.EVENT_NAME];
      eventDiscription = map[DatabaseProviderHelper.EVENT_DISCRIPTION];
      eventColorNumber = map[DatabaseProviderHelper.EVENT_COLOR_NUMBER];
      itsMonthIT = map[DatabaseProviderHelper.ITS_MONTH_IT] == 1;
      monthITQuantityOfRepeats =
      map[DatabaseProviderHelper.MONTH_IT_QUANTITY_OF_REPEATS];
      monthITDayOfMonth = map[DatabaseProviderHelper.MONTH_IT_DAY_OF_MONTH];
      itsCustomTimeIT = map[DatabaseProviderHelper.ITS_CUSTOM_TI] == 1;
      customTimeITType = map[DatabaseProviderHelper.CUSTOM_TIME_IT_TYPE];
      customTimeITRepeatsAllTime =
      map[DatabaseProviderHelper.CUSTOM_TIME_IT_REPEATS_ALL_TIME];
      customTimeITQuantityOfRepeats =
      map[DatabaseProviderHelper.CUSTOM_TIME_IT_QUANTITY_OF_REPEATS];
      customTimeITTimeInterval =
      map[DatabaseProviderHelper.CUSTOM_TIME_IT_TIME_INTERVAL];
      itsOneTimeType = map[DatabaseProviderHelper.ITS_ONE_TIME_TYPE] == 1;
      oneTimeTypeDate = map[DatabaseProviderHelper.ONE_TIME_TYPE_DATE];
      startDateMillis = map[DatabaseProviderHelper.START_DATE_MILLIS];
      startDateString = map[DatabaseProviderHelper.START_DATE_STRING];
      itsEventDefaultTime =
          map[DatabaseProviderHelper.ITS_EVENT_DEFAULT_TIME] == 1;
      eventTimeMillis = map[DatabaseProviderHelper.EVENT_TIME_MILLIS];
      eventTimeString = map[DatabaseProviderHelper.EVENT_TIME_STRING];
  }
}