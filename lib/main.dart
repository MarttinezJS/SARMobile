import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/core/config/routes.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/page_manager.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/service_locator.dart';
import 'package:sigue_adelante_radio/src/shared/helpers/modal_helper.dart';

void main() async {
  await setupServiceLocator();
  runApp( const MyApp());
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
  void dispose() {
    getIt<PageManager>().dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      navigatorKey: ModalHelper.navigatorKey,
      title: 'Sigue adelante radio',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: routes,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary:  Color.fromRGBO(255, 190, 36, 1),
          background: Color.fromRGBO(255, 236, 179, 1),
        )
      ),
    );
  }
}