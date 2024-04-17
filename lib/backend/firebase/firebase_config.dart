import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDTaBY5QfDbPXdQGVYIVifdCsbqF4Ed98A",
            authDomain: "development-417611.firebaseapp.com",
            projectId: "development-417611",
            storageBucket: "development-417611.appspot.com",
            messagingSenderId: "159120615271",
            appId: "1:159120615271:web:5eab7cf9ecedc12a74f1c2"));
  } else {
    await Firebase.initializeApp();
  }
}
