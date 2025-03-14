import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/shared/home/services/page_manager.dart';
import 'package:sigue_adelante_radio/src/core/config/service_locator.dart';


class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

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
            );
            break;
          case ButtonState.playing:
            method = pageManager.pause;
            buttonChild = Icon(
              Icons.pause,
            );
            break;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: IconButton(
            onPressed: method,
            icon: buttonChild,
            iconSize: 60,
          ),
        );
      }
    );
  }
}
