import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAqi1pvgX6ltzG3lO09c-v12ZiT7CK_qM4",
            authDomain: "gersonalorganizer-67547.firebaseapp.com",
            projectId: "gersonalorganizer-67547",
            storageBucket: "gersonalorganizer-67547.appspot.com",
            messagingSenderId: "783216072626",
            appId: "1:783216072626:web:73c58a71aeff3695d736ab",
            measurementId: "G-PP3TE9W2K1"));
  } else {
    await Firebase.initializeApp();
  }
}
