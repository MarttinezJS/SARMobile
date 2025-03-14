import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final double fontSize;
  const InfoWidget({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Teléfono: ',
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            Text(
              '(+57)313 871 5190',
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ),
        Row(
          children: [
            Text(
              'Dirección: ',
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            Text(
              'Cr 23 # 6D-22 Valledupar, Colombia',
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ),
        Row(
          children: [
            Text(
              'Email: ',
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            Text(
              'fidel.barros@sigueadelanteradio.com',
              style: TextStyle(fontSize: fontSize),
            )
          ],
        )
      ],
    );
  }
}
