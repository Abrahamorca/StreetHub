import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g3_project/firebase_options.dart';
import 'package:g3_project/models/user.dart';
import 'package:g3_project/screens/Home/home.dart';
import 'package:g3_project/screens/Login/login.dart';
import 'package:g3_project/screens/loading.dart';
import 'package:g3_project/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/login': (context) => const Login(),
          '/home': (context) => const Home(),
        },
      ),
    );
  }
}

