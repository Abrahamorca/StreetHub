import 'package:g3_project/screens/Home/home.dart';
import 'package:g3_project/screens/Home/score.dart';
import 'package:g3_project/screens/Home/search.dart';
import 'package:g3_project/screens/Login/register.dart';
import 'package:g3_project/screens/Login/sign_in.dart';
import 'package:g3_project/screens/Login/authenticate.dart';
import 'package:g3_project/screens/Settings/settings.dart';
import 'package:g3_project/screens/Settings/main_settings.dart';
import 'package:g3_project/screens/Teams/teams_options.dart';
import 'package:g3_project/screens/loading.dart';
import 'package:g3_project/screens/Matches/options_match.dart';

class Routes {
  static const String signIn = SignIn.routeName;
  static const String loading = Loading.routeName;
  static const String authenticate = Authenticate.routeName;
  static const String register = Register.routeName;
  static const String settings = Settings.routeName;
  static const String home = Home.routeName;
  static const String search = Search.routeName;
  static const String score = Score.routeName;
  static const String game = GameScreen.routeName;
  static const String settings = SettingsScreen.routeName;
  static const String teams = TeamsScreen.routeName;
}
