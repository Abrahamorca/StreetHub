import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g3_project/routes.dart';
import 'package:g3_project/screens/Login/sign_in.dart';
import 'package:g3_project/services/auth.dart';

import '../loading.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  static const String routeName = '/settings';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton(
              onPressed: () async {
                await _auth.signOut();
                if (!mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Loading()),
                );
              },
              child: const Icon(Icons.logout)),
        ],
      ),
    );
  }
}
