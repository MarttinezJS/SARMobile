import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/modules/home/widgets/background_widget.dart';
import 'package:sigue_adelante_radio/src/modules/home/widgets/info_widget.dart';
import 'package:sigue_adelante_radio/src/modules/home/widgets/play_button.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final primaryColor = Theme.of(context).colorScheme.primary; 
    final backgroundColor = Theme.of(context).colorScheme.background; 
    final size = MediaQuery.of(context).size;
    final fontSize = sqrt(pow(size.width,2)+pow(size.height, 2)) * 0.02;
    
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Background(primaryColor: primaryColor, backgroundColor: backgroundColor),
          Positioned(
            top: size.height * 0.05,
            child: Text('Sigue Adelante Radio',
              style: TextStyle( 
                fontWeight: FontWeight.bold,
                fontSize: sqrt(pow(size.width,2)+pow(size.height, 2)) * 0.038,
                color: backgroundColor
              ),
            ),
          ),
           Container(
            width: size.width * 0.4,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              color: primaryColor,
              image: DecorationImage( 
                image: const AssetImage('assets/imgs/Logo-Sigue-Adelante-Header-1-1-scaled.jpg'),
                scale: sqrt(pow(size.width,2)+pow(size.height, 2)) * 0.03,
              ),
              borderRadius: BorderRadius.circular(100)
            ),
          ),
          Positioned(
            left: size.width * 0.3,
            bottom: size.height * 0.1,
            height: size.height * 0.2,
            width: size.width * 0.4,
            child: PlayButton(primaryColor: primaryColor, size: size, backgroundColor: backgroundColor),
          ),
          Positioned(
            bottom: size.height * 0.01,
            child: InfoWidget(fontSize: fontSize)
          )
        ],
      )
   );
  }
}