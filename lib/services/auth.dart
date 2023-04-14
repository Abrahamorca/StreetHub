import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:g3_project/models/user.dart';
import 'package:g3_project/services/database.dart';
import 'package:latlng/latlng.dart';

class AuthService {
  /* Generating the variable that will communicate with
  * the Auth services */
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create User obj based on FirebaseUser
  UserModel? _userFromFirebaseUser(User user) {
    if (user != null) {
      return UserModel(uid: user.uid);
    } else {
      return null;
    }
  }

  //auth change user stream
  Stream<UserModel?> get user {
    return _auth
        .authStateChanges()
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

//sign in with email and password method
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFromFirebaseUser(user!);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      return null;
    }
  }

//register with email and password method
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      //create a new document for the user with the uid
      //TODO: Add the current location of the device into the function
      await DataBaseService(uid: user!.uid).updateUserData(DateTime.now().toString(),'41.39433770435271', '2.1279648588561013');
      return _userFromFirebaseUser(user!);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return;
    }
  }
}
