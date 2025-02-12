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
    apiKey: 'AIzaSyDMdzVhymv2qMPp09_dHLRRoeFQY_vD9CI',
    appId: '1:475649513350:web:7257f5f82615642cfcbe07',
    messagingSenderId: '475649513350',
    projectId: 'smart-meal-6bf64',
    authDomain: 'smart-meal-6bf64.firebaseapp.com',
    storageBucket: 'smart-meal-6bf64.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAX8Am9J1dkCDZFXes1RrIvzWEMdsnzQWk',
    appId: '1:475649513350:android:6fbe7b0aa3d8bc73fcbe07',
    messagingSenderId: '475649513350',
    projectId: 'smart-meal-6bf64',
    storageBucket: 'smart-meal-6bf64.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCC7Qe3cEuwHm5bC2kwLNsKFWRo03sCkR8',
    appId: '1:475649513350:ios:b918da7220dce198fcbe07',
    messagingSenderId: '475649513350',
    projectId: 'smart-meal-6bf64',
    storageBucket: 'smart-meal-6bf64.firebasestorage.app',
    iosBundleId: 'com.example.smartMeal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCC7Qe3cEuwHm5bC2kwLNsKFWRo03sCkR8',
    appId: '1:475649513350:ios:b918da7220dce198fcbe07',
    messagingSenderId: '475649513350',
    projectId: 'smart-meal-6bf64',
    storageBucket: 'smart-meal-6bf64.firebasestorage.app',
    iosBundleId: 'com.example.smartMeal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDMdzVhymv2qMPp09_dHLRRoeFQY_vD9CI',
    appId: '1:475649513350:web:5e0e62508329ef76fcbe07',
    messagingSenderId: '475649513350',
    projectId: 'smart-meal-6bf64',
    authDomain: 'smart-meal-6bf64.firebaseapp.com',
    storageBucket: 'smart-meal-6bf64.firebasestorage.app',
  );
}
