import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  /* Generating the variable that will communicate with
  * the Auth services */
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //TODO: sign in anonymously method
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      return user;
    } catch (e) {
      // Checking if we're on debug mode
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

//TODO: sign in with email and password method

//TODO: register with email and password method

//TODO: sign out method
}
