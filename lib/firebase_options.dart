// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCsWv9bkkA9eh8iuOtlKZqWk5vMD2vs6Cg',
    appId: '1:458396603404:web:e348e5496148c490d44a29',
    messagingSenderId: '458396603404',
    projectId: 'time-attendance-app-flutter-db',
    authDomain: 'time-attendance-app-flutter-db.firebaseapp.com',
    storageBucket: 'time-attendance-app-flutter-db.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6QIm6yFZ8HkMkxXebcX6v6Et8I9jXl5M',
    appId: '1:458396603404:android:b89ec4d18b33c1c1d44a29',
    messagingSenderId: '458396603404',
    projectId: 'time-attendance-app-flutter-db',
    storageBucket: 'time-attendance-app-flutter-db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEgJ7arKh9CXqmPS7afezb2khWcdnQAfw',
    appId: '1:458396603404:ios:ba634075f5e269e4d44a29',
    messagingSenderId: '458396603404',
    projectId: 'time-attendance-app-flutter-db',
    storageBucket: 'time-attendance-app-flutter-db.appspot.com',
    iosClientId: '458396603404-uv0lr25f1t0pccp6sqcr9iaqea862fed.apps.googleusercontent.com',
    iosBundleId: 'com.example.timeAttendanceAppFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEgJ7arKh9CXqmPS7afezb2khWcdnQAfw',
    appId: '1:458396603404:ios:ba634075f5e269e4d44a29',
    messagingSenderId: '458396603404',
    projectId: 'time-attendance-app-flutter-db',
    storageBucket: 'time-attendance-app-flutter-db.appspot.com',
    iosClientId: '458396603404-uv0lr25f1t0pccp6sqcr9iaqea862fed.apps.googleusercontent.com',
    iosBundleId: 'com.example.timeAttendanceAppFlutter',
  );
}
