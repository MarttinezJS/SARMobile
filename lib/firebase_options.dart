// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCbxNvknvDz83VhK9T8RW0cACnu7A1ik9g',
    appId: '1:465733191158:web:779df5d3dbdd0dc730f3d7',
    messagingSenderId: '465733191158',
    projectId: 'sigue-adelante-radio',
    authDomain: 'sigue-adelante-radio.firebaseapp.com',
    storageBucket: 'sigue-adelante-radio.firebasestorage.app',
    measurementId: 'G-0PLCWDD02M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDra7labajnrArlpL8pV3nJ6TNZurk_Xd4',
    appId: '1:465733191158:android:562f8b3be4cb463f30f3d7',
    messagingSenderId: '465733191158',
    projectId: 'sigue-adelante-radio',
    storageBucket: 'sigue-adelante-radio.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJGCQnJmSN0AEexrSoIO2c839uJ14Jdwo',
    appId: '1:465733191158:ios:51f3d58fee4fedb630f3d7',
    messagingSenderId: '465733191158',
    projectId: 'sigue-adelante-radio',
    storageBucket: 'sigue-adelante-radio.firebasestorage.app',
    iosBundleId: 'com.example.sigueAdelanteRadio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJGCQnJmSN0AEexrSoIO2c839uJ14Jdwo',
    appId: '1:465733191158:ios:51f3d58fee4fedb630f3d7',
    messagingSenderId: '465733191158',
    projectId: 'sigue-adelante-radio',
    storageBucket: 'sigue-adelante-radio.firebasestorage.app',
    iosBundleId: 'com.example.sigueAdelanteRadio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCbxNvknvDz83VhK9T8RW0cACnu7A1ik9g',
    appId: '1:465733191158:web:899030bec1ae531930f3d7',
    messagingSenderId: '465733191158',
    projectId: 'sigue-adelante-radio',
    authDomain: 'sigue-adelante-radio.firebaseapp.com',
    storageBucket: 'sigue-adelante-radio.firebasestorage.app',
    measurementId: 'G-ZDN6GBN755',
  );
}
