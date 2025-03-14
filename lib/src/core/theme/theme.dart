import 'package:flutter/material.dart';

final yellowPrimary = Color.fromRGBO(255, 190, 36, 1);
final yellowBackground = Color.fromRGBO(255, 236, 179, 1);
final brown = Color.fromRGBO(130, 103, 84, 1);

final themeData = ThemeData(
  useMaterial3: true,
  primaryColor: yellowPrimary,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: brown,
    backgroundColor: yellowBackground
  ),
  appBarTheme: AppBarTheme(
    color: yellowPrimary,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontFamily: 'Space'
    )
  ),
  scaffoldBackgroundColor: yellowBackground,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(brown),
      backgroundColor: WidgetStatePropertyAll(yellowPrimary),
      shadowColor: WidgetStatePropertyAll(brown),
    )
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    circularTrackColor: yellowBackground,
    color: brown
  ),
  iconTheme: IconThemeData(
    color: brown
  ),
);