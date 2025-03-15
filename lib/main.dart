import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sigue_adelante_radio/src/core/config/push_notifications_service.dart';
import 'package:sigue_adelante_radio/src/core/config/ws_client.dart';
import 'package:sigue_adelante_radio/src/shared/home/services/page_manager.dart';
import 'package:sigue_adelante_radio/src/core/config/service_locator.dart';
import 'package:sigue_adelante_radio/src/core/theme/theme.dart';
import 'package:sigue_adelante_radio/src/shared/home/pages/home.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await setupServiceLocator();
  await WsClient.initWs();
  await PushNotificationsService.initApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    PushNotificationsService.messagesStream.listen((notification) {
      print(notification);
    },);
    getIt<PageManager>().init();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sigue adelante radio',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: themeData
    );
  }

  @override
  void dispose() {
    getIt<PageManager>().dispose();
    PushNotificationsService.closeStream();
    WsClient.channel.sink.close(0);
    super.dispose();
  }
}