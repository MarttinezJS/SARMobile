import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sigue_adelante_radio/src/core/config/page_manager.dart';
import 'package:sigue_adelante_radio/src/core/config/service_locator.dart';
import 'package:sigue_adelante_radio/src/core/theme/theme.dart';
import 'package:sigue_adelante_radio/src/modules/home/pages/home.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await setupServiceLocator();
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
    super.dispose();
  }
}