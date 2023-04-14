import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:g3_project/screens/Home/score.dart';
import 'package:g3_project/screens/Settings/settings.dart';
import 'package:g3_project/screens/Settings/main_settings.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:g3_project/screens/Home/home.dart';
import 'package:g3_project/utils.dart';

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

  String _searchQuery = "";
  List<Player> _searchResults = [];
  int? score;

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


  final List<Player> _players = [
    Player(name: "Guillem Pedret", score: 100),
    Player(name: "Abraham Ortega", score: 80),
    Player(name: "Carles Pellitero", score: 70),
    Player(name: "Josep Fiestas", score: 60),
    Player(name: "Alejandro Becerra", score: 50),
    Player(name: "David Salcedo", score: 40),
    Player(name: "Javier Carrascosa", score: 30),
    Player(name: "Albert Pineda", score: 20),
    Player(name: "Sergi Carreras", score: 10),
  ];


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

  Widget _buildSearchField() {
    return Autocomplete<Player>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const [];
        }

        final filteredPlayers = _players.where((player) =>
            player.name.toLowerCase().contains(textEditingValue.text.toLowerCase())
        ).toList();

        return filteredPlayers;
      },
      displayStringForOption: (player) => player.name,
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
          onChanged: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
        );
      },
      onSelected: (player) {
        setState(() {
          score = player.score;
        });
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
            child: _buildSearchField()
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundLoginColor),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
            child: _buildSearchBar(),
          ),
          SizedBox(height: 280),
          if(score != null)
          Center(child: Text(score.toString(), style: TextStyle(fontSize: 50),),)
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
