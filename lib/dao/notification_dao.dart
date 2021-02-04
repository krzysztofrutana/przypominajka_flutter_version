import 'package:przypominajka_flutter/utils/database_provider.dart';
import 'package:przypominajka_flutter/models/notificationModel.dart';
import 'package:przypominajka_flutter/helpers/database_provider_helper.dart';

class NotificationDAO {
  final DatabaseProvider _databaseProvider = DatabaseProvider.db;

  Future<List<Notification>> getAllNotification() async {
    final db = await _databaseProvider.database;

    var notifications =
    await db.query(DatabaseProviderHelper.TABLE_NOTIFICATIONS, columns: DatabaseProviderHelper.NOTIFICATION_TABLE_COLUMN);
    List<Notification> notificationList = List<Notification>();

    notifications.forEach((element) {
      Notification notification = Notification.fromMap(element);
      notificationList.add(notification);
    });
    return notificationList;
  }

  Future<Notification> getNotificationByName(String name) async {
    final db = await _databaseProvider.database;

    List<Map<String, dynamic>> result;
    if (name != null) {
      if (name.isNotEmpty)
        result = await db.query(DatabaseProviderHelper.TABLE_NOTIFICATIONS,
            columns: DatabaseProviderHelper.NOTIFICATION_TABLE_COLUMN,
            where: '${DatabaseProviderHelper.NOTIFICATION_EVENT_NAME} LIKE ?',
            whereArgs: [name]);
      Notification notification = Notification.fromMap(result.first);
      return notification;
    } else {
      return null;
    }
  }

  Future<int> getNotificationId(String name) async {
    final db = await _databaseProvider.database;

    List<Map<String, dynamic>> result;
    if (name != null) {
      if (name.isNotEmpty)
        result = await db.query(DatabaseProviderHelper.TABLE_NOTIFICATIONS,
            columns: DatabaseProviderHelper.NOTIFICATION_TABLE_COLUMN,
            where: '${DatabaseProviderHelper.NOTIFICATION_EVENT_NAME} LIKE ?',
            whereArgs: [name]);
      Notification notification = Notification.fromMap(result.first);
      return notification.id;
    } else {
      return -1;
    }
  }

  Future<int> getNotificationAlarmId(String name) async {
    final db = await _databaseProvider.database;

    List<Map<String, dynamic>> result;
    if (name != null) {
      if (name.isNotEmpty)
        result = await db.query(DatabaseProviderHelper.TABLE_NOTIFICATIONS,
            columns: DatabaseProviderHelper.NOTIFICATION_TABLE_COLUMN,
            where: '${DatabaseProviderHelper.NOTIFICATION_EVENT_NAME} LIKE ?',
            whereArgs: [name]);
      Notification notification = Notification.fromMap(result.first);
      return notification.notificationAlarmID;
    } else {
      return -1;
    }
  }

  Future<int> updateNotification(Notification notification) async {
    final db = await _databaseProvider.database;

    var result = await db.update(DatabaseProviderHelper.TABLE_NOTIFICATIONS, notification.toMap(),
        where: "${DatabaseProviderHelper.NOTIFICATION_ID} = ?", whereArgs: [notification.id]);

    return result;
  }

  Future<int> deleteNotificationByID(int id) async {
    final db = await _databaseProvider.database;

    var result = await db.delete(DatabaseProviderHelper.TABLE_NOTIFICATIONS,
        where: "${DatabaseProviderHelper.NOTIFICATION_ID} = ?", whereArgs: [id]);

    return result;
  }

  Future<int> deleteNotificationByName(String name) async {
    final db = await _databaseProvider.database;

    var result = await db.delete(DatabaseProviderHelper.TABLE_NOTIFICATIONS,
        where: "${DatabaseProviderHelper.NOTIFICATION_EVENT_NAME} = ?", whereArgs: [name]);

    return result;
  }

  Future<int> insertNotification(Notification notification) async {
    final db = await _databaseProvider.database;

    notification.id = await db.insert(DatabaseProviderHelper.TABLE_NOTIFICATIONS, notification.toMap());

    return notification.id;
  }
}