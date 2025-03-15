
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sigue_adelante_radio/firebase_options.dart';
import 'package:sigue_adelante_radio/src/shared/models/push_notification.dart';

class PushNotificationsService {
  static PushNotification? pushNotification;
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static String token = '';
  static final StreamController<PushNotification> _messageController = StreamController.broadcast();
  static Stream<PushNotification> get messagesStream => _messageController.stream;

  static Future initApp() async {
    await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform );
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      return;
    }

    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      token = newToken;
    });
    try {
      token = await _firebaseMessaging.getToken() ?? '';
      print(token);
      FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
      FirebaseMessaging.onMessage.listen(_onMessageHandler);
      FirebaseMessaging.onMessageOpenedApp.listen(_openMessageHandler);
    } catch (e) {
      // Firebase no inicializó
    }
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    _messageController.add(_mapPush(message));
  }

  static Future _openMessageHandler(RemoteMessage message) async {
    _messageController.add(_mapPush(message));
  }

  static Future _backgroundHandler(RemoteMessage message) async {
    _messageController.add(_mapPush(message));
  }

  static _mapPush(RemoteMessage message) {
    return PushNotification(
      title: message.notification!.title ?? '',
      body: message.notification!.body ?? ''
    );
  }

  static closeStream() {
    _messageController.close();
  }
}
