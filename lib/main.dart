import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g3_project/firebase_options.dart';
import 'package:g3_project/models/user.dart';
import 'package:g3_project/screens/Home/home.dart';
import 'package:g3_project/screens/Home/score.dart';
import 'package:g3_project/screens/Home/search.dart';
import 'package:g3_project/screens/Login/login.dart';
import 'package:g3_project/screens/Login/sign_in.dart';
import 'package:g3_project/screens/loading.dart';
import 'package:g3_project/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:g3_project/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    StreamProvider<UserModel?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.iOS: _NoAnimationPageTransitionsBuilder(),
        TargetPlatform.android: _NoAnimationPageTransitionsBuilder(),
        })),

    debugShowCheckedModeBanner: false,
    initialRoute: Routes.home,
    routes: {
      Routes.loading: (context) => new Loading(),
      Routes.login: (context) => new Login(),
      Routes.home: (context) => new Home(),
      Routes.signIn: (context) => new SignIn(),
      Routes.search: (context) => new Search(),
      Routes.score: (context) => new Score()
    },
  ),);
  ),
}

class _NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const _NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}

