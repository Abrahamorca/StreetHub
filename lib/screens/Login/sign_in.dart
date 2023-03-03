import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g3_project/services/auth.dart';
import 'package:g3_project/utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundLoginColor),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
        child: ElevatedButton(
          child: const Text('Sign In anon'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();

            if (result == null) {
              if (kDebugMode) {
                print('error signing in');
              }
            } else {
              if (kDebugMode) {
                print('signed in');
                print(result);
              }
            }
          },
        ),
      ),
    );
  }
}
