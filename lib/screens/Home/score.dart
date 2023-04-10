import 'package:flutter/material.dart';
import 'package:g3_project/screens/Home/search.dart';
import 'package:g3_project/screens/Settings/main_settings.dart';

import 'package:location/location.dart';
import 'package:g3_project/screens/Home/home.dart';

import '../../routes.dart';

class Score extends StatefulWidget {
  const Score({Key? key}) : super(key: key);
  static const String routeName = '/score';

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  int _selectedIndex = 2;
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "Leaderboard",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: ListView.builder(
                    itemCount: _players.length,
                    itemBuilder: (BuildContext context, int index) {
                      final player = _players[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange[500],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                  fontFamily: "SF Pro Display",
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            player.name,
                            style: TextStyle(
                              fontFamily: "SF Pro Display",
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(
                            "${player.score}",
                            style: TextStyle(
                              fontFamily: "SF Pro Display",
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
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
                      child: Text('Game', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
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

class Player {
  final String name;
  final int score;

  Player({required this.name, required this.score});
}
