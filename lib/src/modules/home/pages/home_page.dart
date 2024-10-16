import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/core/config/theme_data.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/page_manager.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/service_locator.dart';
import 'package:sigue_adelante_radio/src/modules/home/widgets/play_button.dart';

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
            color: primaryColor.withOpacity(0.3),
            child: Row(
              children: [
                 Transform.translate(
                  offset: Offset(0, size.height * - 0.04),
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
                              width: 300,
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
                        )
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
  // @override
  // Widget build(BuildContext context) {
  //   final primaryColor = Theme.of(context).colorScheme.primary;
  //   final backgroundColor = Theme.of(context).colorScheme.surface;
  //   final size = MediaQuery.of(context).size;
  //   final fontSize = sqrt(pow(size.width, 2) + pow(size.height, 2)) * 0.02;

  //   return Scaffold(
  //       body: Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       Background(
  //           primaryColor: primaryColor, backgroundColor: backgroundColor),
  //       Positioned(
  //         top: size.height * 0.05,
  //         child: Text(
  //           'Sigue Adelante Radio',
  //           style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize:
  //                   sqrt(pow(size.width, 2) + pow(size.height, 2)) * 0.038,
  //               color: backgroundColor),
  //         ),
  //       ),
  //       Container(
  //         width: size.width * 0.4,
  //         height: size.height * 0.2,
  //         decoration: BoxDecoration(
  //             color: primaryColor,
  //             image: DecorationImage(
  //               image: const AssetImage(
  //                   'assets/imgs/Logo-Sigue-Adelante-Header-1-1-scaled.jpg'),
  //               scale: sqrt(pow(size.width, 2) + pow(size.height, 2)) * 0.03,
  //             ),
  //             borderRadius: BorderRadius.circular(100)),
  //       ),
  //       Positioned(
  //         left: size.width * 0.3,
  //         bottom: size.height * 0.1,
  //         height: size.height * 0.2,
  //         width: size.width * 0.4,
  //         child: PlayButton(
  //             primaryColor: primaryColor,
  //             size: size,
  //             backgroundColor: backgroundColor),
  //       ),
  //       Positioned(
  //           bottom: size.height * 0.01, child: InfoWidget(fontSize: fontSize))
  //     ],
  //   ));
  // }
}
