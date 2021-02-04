import 'package:przypominajka_flutter/helpers/database_provider_helper.dart';
class Notification {

  int id;
  String notificationEventName;
  int notificationAlarmID;
  int notificationDateMillis;
  String notificationDateString;
  String notificationTimeString;
  double notificationTimeDouble;
  bool itsNotificationComplete;

  Notification({this.id, this.notificationEventName, this.notificationAlarmID, this.notificationDateMillis,
  this.notificationDateString, this.notificationTimeString, this.notificationTimeDouble, this.itsNotificationComplete});


  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProviderHelper.NOTIFICATION_EVENT_NAME: notificationEventName,
      DatabaseProviderHelper.NOTIFICATION_ALARM_ID: notificationAlarmID,
      DatabaseProviderHelper.NOTIFICATION_DATE_MILLIS: notificationDateMillis,
      DatabaseProviderHelper
          .NOTIFICATION_DATE_STRING: notificationDateString,
      DatabaseProviderHelper.NOTIFICATION_TIME_STRING: notificationTimeString,
      DatabaseProviderHelper.NOTIFICATION_TIME_DOUBLE: notificationTimeDouble,
      DatabaseProviderHelper.NOTIFICATION_COMPLETED: itsNotificationComplete ? 1 : 0
    };

    if (id != null) {
      map[DatabaseProviderHelper.NOTIFICATION_ID] = id;
    }

    return map;
  }

  Notification.fromMap(Map<String, dynamic> map){
    id = map[DatabaseProviderHelper.NOTIFICATION_ID];
    notificationEventName = map[DatabaseProviderHelper.NOTIFICATION_EVENT_NAME];
    notificationAlarmID = map[DatabaseProviderHelper.NOTIFICATION_ALARM_ID];
    notificationDateMillis = map[DatabaseProviderHelper.NOTIFICATION_DATE_MILLIS];
    notificationDateString =
    map[DatabaseProviderHelper.NOTIFICATION_DATE_STRING];
    notificationTimeString = map[DatabaseProviderHelper.NOTIFICATION_TIME_STRING];
    notificationTimeDouble = map[DatabaseProviderHelper.NOTIFICATION_TIME_DOUBLE];
    itsNotificationComplete = map[DatabaseProviderHelper.NOTIFICATION_COMPLETED] == 1;
  }

}