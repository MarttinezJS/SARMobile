import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/page_manager.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/service_locator.dart';

class PlayButton extends StatelessWidget {
  final Color primaryColor;
  final Size size;
  final Color backgroundColor;
  const PlayButton({super.key, required this.primaryColor, required this.size, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {

    final pageManager = getIt<PageManager>();

    return ValueListenableBuilder(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {

        final Widget buttonChild; 
        final void Function()? method;

        switch (value) {
          case ButtonState.loading:
            buttonChild = const CircularProgressIndicator();
            method = null;
          break;
          case ButtonState.paused:
            method = pageManager.play;
            buttonChild = Icon(
              Icons.play_arrow,
              color: Colors.black,
              size: sqrt(pow(size.width,2)+pow(size.height, 2)) * 0.15,
            );
              
          break;
          case ButtonState.playing:
            method = pageManager.pause;
            buttonChild = Icon(
              Icons.pause,
              color: Colors.black,
              size: sqrt(pow(size.width,2)+pow(size.height, 2)) * 0.15,
            );
            break;
          default:
            buttonChild = const SizedBox();
            method = null;
          break;
        }
        return MaterialButton(
          splashColor: primaryColor,
          highlightColor: Colors.transparent,
          color: backgroundColor,
          elevation: 0,
          height: size.height * 0.2,
          onPressed: method,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: buttonChild
        );
      }
    );
  }
}