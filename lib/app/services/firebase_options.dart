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
    apiKey: 'AIzaSyB8kNQfcz2AW9U2sH62oxiTxl-B3dvspFI',
    appId: '1:290318267639:web:8e8c3a4918b17096850ff2',
    messagingSenderId: '290318267639',
    projectId: 'fcmtest-d89c8',
    authDomain: 'fcmtest-d89c8.firebaseapp.com',
    storageBucket: 'fcmtest-d89c8.appspot.com',
    measurementId: 'G-3GPXVVDMHK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqcQQtZdvnwQID7mhTFvHT3DVSuEkjQzo',
    appId: '1:290318267639:android:4fa14b19c679f817850ff2',
    messagingSenderId: '290318267639',
    projectId: 'fcmtest-d89c8',
    storageBucket: 'fcmtest-d89c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlluMIYBJ0c1BiP4Ize6iJcSr9EwZ5P1I',
    appId: '1:290318267639:ios:d6f68dcae9ad0e0a850ff2',
    messagingSenderId: '290318267639',
    projectId: 'fcmtest-d89c8',
    storageBucket: 'fcmtest-d89c8.appspot.com',
    iosBundleId: 'com.example.fcmapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlluMIYBJ0c1BiP4Ize6iJcSr9EwZ5P1I',
    appId: '1:290318267639:ios:d6f68dcae9ad0e0a850ff2',
    messagingSenderId: '290318267639',
    projectId: 'fcmtest-d89c8',
    storageBucket: 'fcmtest-d89c8.appspot.com',
    iosBundleId: 'com.example.fcmapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB8kNQfcz2AW9U2sH62oxiTxl-B3dvspFI',
    appId: '1:290318267639:web:5784d5bbc302fcf0850ff2',
    messagingSenderId: '290318267639',
    projectId: 'fcmtest-d89c8',
    authDomain: 'fcmtest-d89c8.firebaseapp.com',
    storageBucket: 'fcmtest-d89c8.appspot.com',
    measurementId: 'G-9Z4R9MJRKC',
  );
}
