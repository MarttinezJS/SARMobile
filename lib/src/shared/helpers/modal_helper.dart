import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalHelper  {
  static final navigatorKey = GlobalKey<NavigatorState>();
  
  static showInfoDialog(){
    final context = navigatorKey.currentContext;
    if (context == null) return;

    showCupertinoDialog(context: context , builder: (_) => CupertinoAlertDialog(
      actions: [
        CupertinoDialogAction(
          child: const Text('Ok'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ),);
  }

  static Future<bool> showLoading({String? text})async {
    final context = navigatorKey.currentContext;
    if (context == null) return false;

    final dialog =  CupertinoAlertDialog(
      content:  CircularProgressIndicator(
        semanticsLabel: text,
      ),
    );

    return await showCupertinoDialog<bool>(
      context: context,
      builder: (_) => dialog
    ) ?? false;
  }
}