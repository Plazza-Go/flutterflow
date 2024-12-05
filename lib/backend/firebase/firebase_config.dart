import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCshu6WQ5bFf5aZSt6dpGcHlUwhRJEaCJM",
            authDomain: "plazza-mvp.firebaseapp.com",
            projectId: "plazza-mvp",
            storageBucket: "plazza-mvp.appspot.com",
            messagingSenderId: "843244942407",
            appId: "1:843244942407:web:d46846bda83d8a0144ad62",
            measurementId: "G-JQQMBNJSEC"));
  } else {
    await Firebase.initializeApp();
  }
}
