import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCBYt3u6bWI71VBMUF75BF1UGVutXCrZ9U',
    appId: '1:700785549389:web:45acfb5ed3da144d9f3c04',
    messagingSenderId: '700785549389',
    projectId: 'notes-flutter-app-5ee7f',
    authDomain: 'notes-flutter-app-5ee7f.firebaseapp.com',
    // databaseURL: 'xxxxxxxxxxxxxxxxxxx',
    storageBucket: 'notes-flutter-app-5ee7f.appspot.com',
    measurementId: 'G-DFHRK45H27',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCZUtLO1oHA51Hs7dCaCp2StiSpmVfkl4',
    // apiKey: 'AIzaSyCBYt3u6bWI71VBMUF75BF1UGVutXCrZ9U',
    appId: '1:700785549389:web:45acfb5ed3da144d9f3c04',
    messagingSenderId: '700785549389',
    projectId: 'notes-flutter-app-5ee7f',
    // databaseURL: 'xxxxxxxxxxxxxxxxxxx',
    storageBucket: 'notes-flutter-app-5ee7f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCZUtLO1oHA51Hs7dCaCp2StiSpmVfkl4',
    // apiKey: 'AIzaSyCBYt3u6bWI71VBMUF75BF1UGVutXCrZ9U',
    appId: 'xxxxxxxxxxxxxxxxxxx',
    messagingSenderId: 'xxxxxxxxxxxxxxxxxxx',
    projectId: 'xxxxxxxxxxxxxxxxxxx',
    databaseURL: 'xxxxxxxxxxxxxxxxxxx',
    storageBucket: 'xxxxxxxxxxxxxxxxxxx',
    androidClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosBundleId: 'xxxxxxxxxxxxxxxxxxx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'xxxxxxxxxxxxxxxxxxx',
    appId: 'xxxxxxxxxxxxxxxxxxx',
    messagingSenderId: 'xxxxxxxxxxxxxxxxxxx',
    projectId: 'xxxxxxxxxxxxxxxxxxx',
    databaseURL: 'xxxxxxxxxxxxxxxxxxx',
    storageBucket: 'xxxxxxxxxxxxxxxxxxx',
    androidClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosBundleId: 'xxxxxxxxxxxxxxxxxxx',
  );
}