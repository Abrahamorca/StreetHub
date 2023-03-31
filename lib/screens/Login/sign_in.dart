import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g3_project/services/auth.dart';
import 'package:g3_project/utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String routeName = '/signIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundLoginColor),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),

              //Mail Field
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20),

              //Password field
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 20),

              // Sign in Button
              ElevatedButton(
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(signInButtonColor),
                ),
                child: const Text(
                  'Sign In',
                ),
              )
            ], // Column children
          ),
        ),
      ),
    );
  }
}
