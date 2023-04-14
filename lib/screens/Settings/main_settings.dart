import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // add this import statement
import 'package:url_launcher/url_launcher.dart';

import '../../routes.dart';
import '../Home/home.dart';
import '../Home/score.dart';
import '../Home/search.dart';
import 'package:g3_project/services/auth.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String routeName = "/settings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedIndex = 3;

  final AuthService _auth = AuthService();

  void _onItemTapped(int index) {
    const List<Widget> screens = [Home(), Search(), Score(), SettingsScreen()];
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF181818),
          title: const Center(
            child: Text(
              'Settings',
              style: TextStyle(
                fontFamily: "SF Pro Display",
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildNotificationSettings(context),
            const Divider(),
            _buildAppInfo(context),
            const Divider(),
            _buildReportBug(context),
            const Divider(),
            _logOutButton(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Score',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            backgroundColor: Colors.black54,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Center(
                      child:
                          Text('Game', style: TextStyle(color: Colors.white)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.game);
                    },
                  ),
                  const Divider(color: Colors.orange),
                  ListTile(
                    title: const Center(
                      child:
                          Text('Team', style: TextStyle(color: Colors.white)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.teams);
                    },
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNotificationSettings(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.notifications),
      title: const Text('Notifications'),
      subtitle: const Text('Manage your notification settings'),
      trailing: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
          AppSettings.openAppSettings(); // use openAppSettings() method
        },
      ),
    );
  }

  Widget _buildAppInfo(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info),
      title: const Text('App Info'),
      subtitle: const Text('Version 1.0.0'),
      onTap: () {
        // TODO: add logic to navigate to app info screen
      },
    );
  }

  Widget _buildReportBug(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.bug_report),
      title: const Text('Report a Bug'),
      subtitle: const Text('Found a bug? Report it here.'),
      onTap: () async {
        const url = 'https://www.salesianssarria.com/';
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          // TODO: handle error if user's device cannot launch email app
        }
      },
    );
  }

  Widget _logOutButton(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout),
      title: const Text('Logout'),
      subtitle: const Text('Exit from the app'),
      onTap: () async {
        await _auth.signOut();
        Navigator.pushNamed(context, Routes.loading);
      },
    );
  }
}
