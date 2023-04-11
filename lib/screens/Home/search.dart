import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:g3_project/screens/Home/score.dart';
import 'package:g3_project/screens/Settings/settings.dart';
import 'package:g3_project/screens/Settings/main_settings.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:g3_project/screens/Home/home.dart';

import '../../routes.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  static const String routeName = '/search';

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  LocationData? _locationData;
  int _selectedIndex = 1;
  late TextEditingController _searchQueryController;

  @override
  void initState() {
    super.initState();
    _searchQueryController = TextEditingController();
  }

  @override
  void dispose() {
    _searchQueryController.dispose();
    super.dispose();
  }

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

  void _searchPressed() {
    // TODO: Implement search functionality
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) {
        // TODO: Implement search functionality
      },
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 15),
          const Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: _buildSearchField(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
            child: _buildSearchBar(),
          ),
        ],
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
                      child: Text('Game', style: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.game);
                    },
                  ),
                  Divider(color: Colors.orange),
                  ListTile(
                    title: Center(
                      child: Text('Team', style: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold)),
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
}
