import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:g3_project/models/user.dart';

class AuthService {
  /* Generating the variable that will communicate with
  * the Auth services */
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create User obj based on FirebaseUser
  UserModel? _userFromFirebaseUser (User user) {
    if (user != null) {
      return UserModel(uid: user.uid);
    } else {
      return null;
    }
  }

  //auth change user stream
  Stream<UserModel?> get user  {
    return _auth.authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  //sign in anonymously method
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
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
