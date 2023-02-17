import 'package:flutter/material.dart';
import 'package:g3_project/screens/Home/home.dart';
import 'package:g3_project/screens/Login/login.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    //TODO: Return either Home or Login screen
    return const Login();
  }
}
