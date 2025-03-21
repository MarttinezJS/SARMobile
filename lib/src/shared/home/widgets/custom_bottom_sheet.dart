import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/core/theme/theme.dart';
import 'package:sigue_adelante_radio/src/shared/home/widgets/custom_progress_bar.dart';
import 'package:sigue_adelante_radio/src/shared/home/widgets/play_button.dart';
import 'package:sigue_adelante_radio/src/shared/home/widgets/song_data.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor. withAlpha(80),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              children: [
                 Transform.translate(
                  offset: Offset(0, size.height * - 0.05),
                  child: PlayButton()
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SongData(secondaryColor: secondaryColor),
                          CustomProgressBar(width: size.width*0.74, secondaryColor: secondaryColor, yellowBackground: yellowBackground,)
                        ],
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
  }
}