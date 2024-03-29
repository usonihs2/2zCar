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
    apiKey: 'AIzaSyAM9ksN2ysmZIMjxExMCxEDcfGMt5B7vGI',
    appId: '1:154732217273:web:f555bb0ec3a94eb94a2c68',
    messagingSenderId: '154732217273',
    projectId: 'rflutterproject',
    authDomain: 'rflutterproject.firebaseapp.com',
    storageBucket: 'rflutterproject.appspot.com',
    measurementId: 'G-DGJKY2ZKTY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQao89LP5I-D411eurRUoZbHRI3YKrgTM',
    appId: '1:154732217273:android:e3b6dfaa217ba5374a2c68',
    messagingSenderId: '154732217273',
    projectId: 'rflutterproject',
    storageBucket: 'rflutterproject.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmigaroi25PFwXc-ej3FX8oxCrMou7HfI',
    appId: '1:154732217273:ios:0eeeec356d978fbe4a2c68',
    messagingSenderId: '154732217273',
    projectId: 'rflutterproject',
    storageBucket: 'rflutterproject.appspot.com',
    iosClientId: '154732217273-pk9q4e0mgjr0nmk44lq2lv6s1l5h4o17.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmigaroi25PFwXc-ej3FX8oxCrMou7HfI',
    appId: '1:154732217273:ios:0eeeec356d978fbe4a2c68',
    messagingSenderId: '154732217273',
    projectId: 'rflutterproject',
    storageBucket: 'rflutterproject.appspot.com',
    iosClientId: '154732217273-pk9q4e0mgjr0nmk44lq2lv6s1l5h4o17.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterProject',
  );
}
