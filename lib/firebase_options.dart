// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDf-1YAHBtfKKVnUCFwMjPBQ8PjIcy1Ogk',
    appId: '1:689531434090:web:2462501fc96e4580e18613',
    messagingSenderId: '689531434090',
    projectId: 'notas-ddd35',
    authDomain: 'notas-ddd35.firebaseapp.com',
    storageBucket: 'notas-ddd35.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChGKTViIAvyat_lm-xnE4-riI9I_VPJck',
    appId: '1:689531434090:android:3b13255b75cdd56fe18613',
    messagingSenderId: '689531434090',
    projectId: 'notas-ddd35',
    storageBucket: 'notas-ddd35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDok5o3L3Q7D4W3mDErS5id8KxD1zbcs7Y',
    appId: '1:689531434090:ios:abdf70340960968fe18613',
    messagingSenderId: '689531434090',
    projectId: 'notas-ddd35',
    storageBucket: 'notas-ddd35.appspot.com',
    iosBundleId: 'com.example.atividadesDadm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDok5o3L3Q7D4W3mDErS5id8KxD1zbcs7Y',
    appId: '1:689531434090:ios:8eec529fcf45ed2ee18613',
    messagingSenderId: '689531434090',
    projectId: 'notas-ddd35',
    storageBucket: 'notas-ddd35.appspot.com',
    iosBundleId: 'com.example.atividadesDadm.RunnerTests',
  );
}
