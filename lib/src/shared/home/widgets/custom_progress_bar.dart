import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/shared/home/services/page_manager.dart';
import 'package:sigue_adelante_radio/src/core/config/service_locator.dart';

class CustomProgressBar extends StatelessWidget {

  final Color secondaryColor;
  final Color yellowBackground;
  final double width;

  const CustomProgressBar({super.key, required this.width, required this.secondaryColor, required this.yellowBackground});

  @override
  Widget build(BuildContext context) {
      final pageManager = getIt<PageManager>();
    return ValueListenableBuilder(
      valueListenable: pageManager.progressData,
      builder: (_, value, __) {
        return SizedBox(
          width: width,
          child: ProgressBar(
            progress: value["currentTime"] ?? Duration.zero, 
            total: value["buffer"] ?? Duration.zero,
            onSeek: pageManager.seek,
            progressBarColor: secondaryColor,
            thumbColor: secondaryColor,
            baseBarColor: yellowBackground,
            thumbCanPaintOutsideBar: false,
            
          )
        );
      }
    );
  }
}