import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD6d-Wi5dqawbMis-AUKixoFPljl8xcotY",
            authDomain: "insurance-80409.firebaseapp.com",
            projectId: "insurance-80409",
            storageBucket: "insurance-80409.appspot.com",
            messagingSenderId: "832347207514",
            appId: "1:832347207514:web:daab822b33afb5abd9a563"));
  } else {
    await Firebase.initializeApp();
  }
}
