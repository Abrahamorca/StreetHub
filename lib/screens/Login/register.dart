import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g3_project/services/auth.dart';
import 'package:g3_project/utils.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.toggleView}) : super(key: key);
  static const String routeName = '/register';

  final dynamic toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/dottedcircle_background.png"),
              fit: BoxFit.fill
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 180),
              //Mail Field
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(55.0)),
                  hintText: 'Email',
                ),
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
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(55.0),
                  ),
                  hintText: 'Password',
                ),
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

              // Register Button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);

                    if (result == null) {
                      setState(() {
                        error = 'please supply valid credentials';
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(signInButtonColor),
                ),
                child: const Text(
                  'Register',
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

          Padding(padding: EdgeInsets.only(left: 2, right: 120),
            child:
              TextButton(
                onPressed: () {
                  widget.toggleView();
                },
                style: ButtonStyle(foregroundColor:MaterialStatePropertyAll(Color(signInButtonColor)), backgroundColor: MaterialStatePropertyAll(Colors.white), shape:  MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    // Change your radius here
                    borderRadius: BorderRadius.circular(16),
                  ),
                ) , ),
                child: Row(
                  children: const [
                    Icon(Icons.person),
                    Text('Go to Sign In'),
                  ],
                ),),
              )
            ], // Column children
          ),
        ),
      ),
    );
  }
}
