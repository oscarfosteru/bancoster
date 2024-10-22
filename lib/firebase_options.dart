import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyC3k76220xW0iMfN02MNkbR4SXj_WbKpRo',
    appId: '1:403288828472:web:0abf82388758a17dc354cd',
    messagingSenderId: '403288828472',
    projectId: 'bancoster-a71eb',
    authDomain: 'bancoster-a71eb.firebaseapp.com',
    storageBucket: 'bancoster-a71eb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtEIwFNe0LrTKTw2BUfOhVLOhK-UPOSs0',
    appId: '1:403288828472:android:08495cf25e2bb114c354cd',
    messagingSenderId: '403288828472',
    projectId: 'bancoster-a71eb',
    storageBucket: 'bancoster-a71eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsA-8JEoMcIZg-eG4KxlfqhsF_Dyw-5lM',
    appId: '1:403288828472:ios:3af34054c74f607ac354cd',
    messagingSenderId: '403288828472',
    projectId: 'bancoster-a71eb',
    storageBucket: 'bancoster-a71eb.appspot.com',
    iosBundleId: 'com.example.bancoster',
  );
}
