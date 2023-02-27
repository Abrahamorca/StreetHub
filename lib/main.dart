import 'dart:js';

import 'package:flutter/material.dart';
import 'package:g3_project/screens/Home/home.dart';
import 'package:g3_project/screens/Login/login.dart';
import 'package:g3_project/screens/loading.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
    );
  }
}
