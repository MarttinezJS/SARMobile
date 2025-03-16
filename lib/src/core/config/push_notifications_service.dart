
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigue_adelante_radio/firebase_options.dart';
import 'package:sigue_adelante_radio/src/core/config/http_client.dart';
import 'package:sigue_adelante_radio/src/core/config/local_notification_service.dart';
import 'package:sigue_adelante_radio/src/shared/models/fm_token_resp.dart';
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
      providesAppNotificationSettings: true
    );

    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      return;
    }

    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      token = newToken;
    });
    try {
      token = await _firebaseMessaging.getToken() ?? '';
      _registerToken(token);
      print(token);
      FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    } catch (e) {
      // Firebase no inicializó
    }
  }
  static _registerToken(String token) async  {
    final preferences = await SharedPreferences.getInstance();
    final deviceId = preferences.getString('deviceId');
    final resp =  await HttpClient.api.post('app/fm-token',
      data: {
        "token": token,
        "deviceId": deviceId,
      }
    );
    final tokenResp = TokenResp.fromJson(resp.data);
    final body = tokenResp.body;
    if (body != null) {
      preferences.setString('deviceId', body.deviceId!);
    }
  }

  static closeStream() {
    _messageController.close();
  }
}

@pragma('vm:entry-point')
Future backgroundHandler(RemoteMessage message) async {
  LocalNotificationService.parseNotification(PushNotification(
    title: message.notification!.title ?? '',
    body: message.notification!.body ?? ''
  ));
}
