import 'package:flutter/material.dart';
import 'package:g3_project/screens/Login/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);
  static const String routeName = '/authenticate';

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return const SignIn();
  }
}
