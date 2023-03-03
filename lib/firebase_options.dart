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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCKc6OtLFTvC9uARIDJn0ZiiMvWEsvGvHw',
    appId: '1:103660134251:web:6c47fd0e013fda70f9762e',
    messagingSenderId: '103660134251',
    projectId: 'streethub-eb0e7',
    authDomain: 'streethub-eb0e7.firebaseapp.com',
    storageBucket: 'streethub-eb0e7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkAYh1OjB_r0bqIi4ri_cZ9UE6EJl_B_o',
    appId: '1:103660134251:android:7d32789f576b5cbef9762e',
    messagingSenderId: '103660134251',
    projectId: 'streethub-eb0e7',
    storageBucket: 'streethub-eb0e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCKgxe8gJUXLJNVdou7btN22k4xhZjEfo',
    appId: '1:103660134251:ios:3e3b399d08e7b56af9762e',
    messagingSenderId: '103660134251',
    projectId: 'streethub-eb0e7',
    storageBucket: 'streethub-eb0e7.appspot.com',
    iosClientId: '103660134251-0bd4tr7i0ls17rs1gtngdk333fp5cf2q.apps.googleusercontent.com',
    iosBundleId: 'g3.s2am.g3Project',
  );
}