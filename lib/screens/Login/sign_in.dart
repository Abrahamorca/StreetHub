import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g3_project/services/auth.dart';
import 'package:g3_project/utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.toggleView}) : super(key: key);
  static const String routeName = '/signIn';

  final dynamic toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundLoginColor),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),

              //Mail Field
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20),

              //Password field
              TextFormField(
                validator: (val) {
                  if (val!.length < 6) {
                    return 'Enter a password 6+ characters long';
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 20),

              // Sign in Button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                    if (result == null) {
                      setState(() {
                        error = 'Could not sign in with those credentials';
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(signInButtonColor),
                ),
                child: const Text(
                  'Sign In',
                ),
              ),

              //Error message text (shows only when register failed)
              const SizedBox(
                height: 20,
              ),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),

              //Toggle forms button
              TextButton(
                onPressed: () {
                  widget.toggleView();
                },
                child: Row(
                  children: const [
                    Icon(Icons.person),
                    Text('Go to register'),
                  ],
                ),
              )
            ], // Column children
          ),
        ),
      ),
    );
  }
}
