import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g3_project/firebase_options.dart';
import 'package:g3_project/screens/Home/home.dart';
import 'package:g3_project/screens/Login/login.dart';
import 'package:g3_project/screens/Login/sign_in.dart';
import 'package:g3_project/screens/loading.dart';
import 'package:g3_project/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      initialRoute: Routes.loading,
      routes: {
        Routes.loading: (context) => new Loading(),
        Routes.login: (context) => new Login(),
        Routes.home: (context) => new Home(),
        Routes.signIn: (context) => new SignIn()
      },
    ),
  );
}
