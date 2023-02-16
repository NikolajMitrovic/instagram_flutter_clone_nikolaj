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
    apiKey: 'AIzaSyAh9c3mBcFhTQg0ZuMzmZdZp9kCQbGN3Qk',
    appId: '1:985225243494:web:7d9a95bb3e948d6b9f76a7',
    messagingSenderId: '985225243494',
    projectId: 'instagram-clone-2b394',
    authDomain: 'instagram-clone-2b394.firebaseapp.com',
    storageBucket: 'instagram-clone-2b394.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRoyhsv9lkRsEpJ49Uky2YHs3Zdkb6TjU',
    appId: '1:985225243494:android:cb191e52d354575a9f76a7',
    messagingSenderId: '985225243494',
    projectId: 'instagram-clone-2b394',
    storageBucket: 'instagram-clone-2b394.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwUSVY5dsoV6niqoBwCFzyirb5IFyBLiw',
    appId: '1:985225243494:ios:2793ed047b98f6c19f76a7',
    messagingSenderId: '985225243494',
    projectId: 'instagram-clone-2b394',
    storageBucket: 'instagram-clone-2b394.appspot.com',
    iosClientId: '985225243494-577qq5i43uiclf15rt7qeckuslc7ve36.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwUSVY5dsoV6niqoBwCFzyirb5IFyBLiw',
    appId: '1:985225243494:ios:2793ed047b98f6c19f76a7',
    messagingSenderId: '985225243494',
    projectId: 'instagram-clone-2b394',
    storageBucket: 'instagram-clone-2b394.appspot.com',
    iosClientId: '985225243494-577qq5i43uiclf15rt7qeckuslc7ve36.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramFlutter',
  );
}
