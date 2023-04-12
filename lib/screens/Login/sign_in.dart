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
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(backgroundLoginColor),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/dottedcircle_background.png"),
              fit: BoxFit.fill
            ),
          ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height:90),
              Container(width: 260, height: 65,
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(231, 186, 118, 1),
                  borderRadius: BorderRadius.circular(30),
                  //border: Border.all(width: 2.0, color: Colors.black),
                ),
                child: Center(child: Text('Welcome', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 25),),),
              ),
              const SizedBox(height:70),
              Padding(padding: EdgeInsets.only(left: 35, right: 35),
                  child: Column(children: <Widget>[
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
                            borderRadius:BorderRadius.circular(55.0)),
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
                  ],),
              ),



              const SizedBox(height: 40),

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
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      // Change your radius here
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ) ,
                  backgroundColor: MaterialStatePropertyAll(const Color(signInButtonColor)),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

              const SizedBox(
                height: 10,
              ),
              Text(
                'or',
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
              Divider(indent: 20, endIndent: 20,thickness: 1, color: Colors.black),
              const SizedBox(
                height: 5,
              ),
              Divider(indent: 50, endIndent: 50,thickness: 1, color: Colors.black),

              TextButton(
                onPressed: () {
                  widget.toggleView();
                },
                style: ButtonStyle(foregroundColor:MaterialStatePropertyAll(Colors.deepOrange), backgroundColor: MaterialStatePropertyAll(Colors.white70), shape: shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                // Change your radius here
                borderRadius: BorderRadius.circular(16),
              ),
        ) , ),
                child: Row(

                  children: const [
                    Icon(Icons.person),
                    Text('U don\'t have an account? Register now!'),
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
