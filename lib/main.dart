import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g3_project/firebase_options.dart';
import 'package:g3_project/models/user.dart';
import 'package:g3_project/routes.dart';
import 'package:g3_project/screens/Home/home.dart';
import 'package:g3_project/screens/Home/score.dart';
import 'package:g3_project/screens/Home/search.dart';
import 'package:g3_project/screens/Login/authenticate.dart';
import 'package:g3_project/screens/Login/register.dart';
import 'package:g3_project/screens/Login/sign_in.dart';
import 'package:g3_project/screens/Settings/settings.dart';
import 'package:g3_project/screens/Matches/options_match.dart';
import 'package:g3_project/screens/Settings/main_settings.dart';
import 'package:g3_project/screens/Teams/teams_options.dart';
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
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: _NoAnimationPageTransitionsBuilder(),
            TargetPlatform.android: _NoAnimationPageTransitionsBuilder(),
          }),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.loading,
        routes: {
          Routes.loading: (context) => new Loading(),
          Routes.login: (context) => new Login(),
          Routes.home: (context) => new Home(),
          //Routes.register: (context) => const Register(toggleView: toggleView,),
          //Routes.signIn: (context) => new SignIn(),
          Routes.search: (context) => new Search(),
          Routes.score: (context) => new Score(),
          Routes.game: (context) => new GameScreen(),
          Routes.settings: (context) => new SettingsScreen(),
          Routes.teams: (context) => new TeamsScreen()
        },
      ),
    );
  }
}

class _NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const _NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
