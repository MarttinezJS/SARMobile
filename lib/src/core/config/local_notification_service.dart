
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sigue_adelante_radio/src/shared/models/push_notification.dart';

class LocalNotificationService {
  static final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  
  static Future init() async {
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
    
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static Future parseNotification(PushNotification notification) async {
  const androidDetails = AndroidNotificationDetails('1', 'notificaciones',
    channelDescription: 'notificaciones de la radio.',
    importance: Importance.max,
    priority: Priority.high
  );
  const iosDetails = DarwinNotificationDetails();
  const notificationDetails = NotificationDetails(
    android: androidDetails,
    iOS: iosDetails
  );

  await _flutterLocalNotificationsPlugin.show(0, notification.title, notification.body, notificationDetails);
}
}