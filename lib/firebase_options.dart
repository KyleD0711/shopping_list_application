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
    apiKey: 'AIzaSyAT0DGKC9IbZYKGkb2Ft90iWpQN7rSGzMg',
    appId: '1:902481494617:web:d8193cfa0388b35dcde748',
    messagingSenderId: '902481494617',
    projectId: 'shoppinglistapp-2e814',
    authDomain: 'shoppinglistapp-2e814.firebaseapp.com',
    storageBucket: 'shoppinglistapp-2e814.appspot.com',
    measurementId: 'G-VYWYDE2YM5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDidMagCLmBbK5XVoU4G-trBZG3NzAEU80',
    appId: '1:902481494617:android:31c5ca8bebaf2604cde748',
    messagingSenderId: '902481494617',
    projectId: 'shoppinglistapp-2e814',
    storageBucket: 'shoppinglistapp-2e814.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaKlFgQxhbsVtT6-nS4AQxrFwRNOeq8Oc',
    appId: '1:902481494617:ios:9c0e5f135abafe31cde748',
    messagingSenderId: '902481494617',
    projectId: 'shoppinglistapp-2e814',
    storageBucket: 'shoppinglistapp-2e814.appspot.com',
    iosBundleId: 'com.kyledenney.shoppingListApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDaKlFgQxhbsVtT6-nS4AQxrFwRNOeq8Oc',
    appId: '1:902481494617:ios:5bc4c267738eb1d1cde748',
    messagingSenderId: '902481494617',
    projectId: 'shoppinglistapp-2e814',
    storageBucket: 'shoppinglistapp-2e814.appspot.com',
    iosBundleId: 'com.kyledenney.shoppingListApplication.RunnerTests',
  );
}