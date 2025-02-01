import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBP4OmHmYy13NEEMTrE_CNbKbS7Fb17n74",
            authDomain: "medibound-portal-hdztzw.firebaseapp.com",
            projectId: "medibound-portal-hdztzw",
            storageBucket: "medibound-portal-hdztzw.firebasestorage.app",
            messagingSenderId: "109501560717",
            appId: "1:109501560717:web:b772eed8d392fa5db12fc4"));
  } else {
    await Firebase.initializeApp();
  }
}
