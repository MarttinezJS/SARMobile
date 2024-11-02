import 'dart:math';
import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/core/config/theme_data.dart';
import 'package:sigue_adelante_radio/src/modules/home/models/points.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/mount_points_service.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/page_manager.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/service_locator.dart';
import 'package:sigue_adelante_radio/src/modules/home/widgets/play_button.dart';
import 'package:sigue_adelante_radio/src/modules/home/widgets/points_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final pageManager = getIt<PageManager>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sigue Adelante Radio'),
      ),
      body: Center(
        child: Image.asset('assets/imgs/logo_sin_fondo.png'),
      ),
      bottomSheet: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              children: [
                 Transform.translate(
                  offset: Offset(0, size.height * - 0.05),
                  child: PlayButton()
                ),
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sigue adelante radio', style: TextStyle(fontWeight: FontWeight.bold, color: secondaryColor),),
                        Text('En vivo', style: TextStyle(color: secondaryColor),),
                        ValueListenableBuilder(
                          valueListenable: pageManager.progressData,
                          builder: (_, value, __) {
                            return SizedBox(
                              width: size.width*0.74,
                              child: ProgressBar(
                                progress: value["currentTime"] ?? Duration.zero, 
                                total: value["buffer"] ?? Duration.zero,
                                progressBarColor: secondaryColor,
                                thumbColor: secondaryColor,
                                baseBarColor: yellowBackground,
                                thumbCanPaintOutsideBar: false,
                                
                              )
                            );
                          }
                        ),
                        // PointsWidget()
                      ],
                    )
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
