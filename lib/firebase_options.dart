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
    apiKey: 'AIzaSyBGOgL5LOG8yp3GKDtlxHpoUUi3dK6p72A',
    appId: '1:82293732847:web:8809ba97377112949b721a',
    messagingSenderId: '82293732847',
    projectId: 'first-project-bf481',
    authDomain: 'first-project-bf481.firebaseapp.com',
    storageBucket: 'first-project-bf481.appspot.com',
    measurementId: 'G-KBFWZF79B3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFYjoA45Hxb2_0YeSfJtN3OsAaKDvK5HA',
    appId: '1:82293732847:android:feca4ce581b7f8a59b721a',
    messagingSenderId: '82293732847',
    projectId: 'first-project-bf481',
    storageBucket: 'first-project-bf481.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLquxFmreuYi9w49k4pOumSbn8YnLmXVc',
    appId: '1:82293732847:ios:deb2a2f5c4c707d09b721a',
    messagingSenderId: '82293732847',
    projectId: 'first-project-bf481',
    storageBucket: 'first-project-bf481.appspot.com',
    iosBundleId: 'com.example.firebaseFirst',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLquxFmreuYi9w49k4pOumSbn8YnLmXVc',
    appId: '1:82293732847:ios:deb2a2f5c4c707d09b721a',
    messagingSenderId: '82293732847',
    projectId: 'first-project-bf481',
    storageBucket: 'first-project-bf481.appspot.com',
    iosBundleId: 'com.example.firebaseFirst',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBGOgL5LOG8yp3GKDtlxHpoUUi3dK6p72A',
    appId: '1:82293732847:web:10ceb6443721d82c9b721a',
    messagingSenderId: '82293732847',
    projectId: 'first-project-bf481',
    authDomain: 'first-project-bf481.firebaseapp.com',
    storageBucket: 'first-project-bf481.appspot.com',
    measurementId: 'G-2L2MS6J3NG',
  );
}
