import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart'; // add this import statement
import 'package:app_settings/app_settings.dart';

import '../../routes.dart';
import '../Home/home.dart';
import '../Home/score.dart';
import '../Home/search.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String routeName = "/settings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen>{
  int _selectedIndex= 3;

  void _onItemTapped(int index) {
    const List<Widget> Screens = [
      Home(),
      Search(),
      Score(),
      SettingsScreen()
    ];
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: Center(
          child: Text('Settings'),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            _buildNotificationSettings(context),
            Divider(),
            _buildAppInfo(context),
            Divider(),
            _buildReportBug(context),
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
            shape: RoundedRectangleBorder(
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
                    title: Center(
                      child: Text('Game', style: TextStyle(color: Colors.white)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.game);
                    },
                  ),
                  Divider(color: Colors.orange),
                  ListTile(
                    title: Center(
                      child: Text('Team', style: TextStyle(color: Colors.white)),
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
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNotificationSettings(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text('Notifications'),
      subtitle: Text('Manage your notification settings'),
      trailing: IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {
          AppSettings.openAppSettings(); // use openAppSettings() method
        },
      ),
    );
  }
  Widget _buildAppInfo(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.info),
      title: Text('App Info'),
      subtitle: Text('Version 1.0.0'),
      onTap: () {
        // TODO: add logic to navigate to app info screen
      },
    );
  }

  Widget _buildReportBug(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.bug_report),
      title: Text('Report a Bug'),
      subtitle: Text('Found a bug? Report it here.'),
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

}

