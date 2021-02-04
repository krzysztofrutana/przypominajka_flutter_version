import 'package:przypominajka_flutter/dao/notification_dao.dart';
import 'package:przypominajka_flutter/models/notificationModel.dart';

class EventRepositories{

  final notificationDAO = NotificationDAO();

  Future getAllNotification() => notificationDAO.getAllNotification();

  Future getNotificationByName(String name) => notificationDAO.getNotificationByName(name);

  Future getNotificationId(String name) => notificationDAO.getNotificationId(name);

  Future getNotificationAlarmId(String name) => notificationDAO.getNotificationAlarmId(name);

  Future updateNotification(Notification notification) => notificationDAO.updateNotification(notification);

  Future deleteNotificationByID(int id) => notificationDAO.deleteNotificationByID(id);

  Future deleteNotificationByName(String name) => notificationDAO.deleteNotificationByName(name);

  Future insertNotification(Notification notification) => notificationDAO.insertNotification(notification);

}