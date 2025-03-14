import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/shared/home/widgets/custom_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sigue Adelante Radio'),
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () => launchUrl(Uri.parse('https://sigueadelanteradio.com/policy')),
            child: Text('Política de datos', style: TextStyle(
              color: Colors.blue, decoration: TextDecoration.underline
            ),),
          ),
          Expanded(
            child: Center(
              child: Image.asset('assets/imgs/logo_sin_fondo.png'),
            ),
          ),
        ],
      ),
      bottomSheet: CustomBottomSheet()
    );
  }
}