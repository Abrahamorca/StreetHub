import 'package:flutter/material.dart';
import 'package:g3_project/screens/Home/search.dart';

import 'package:location/location.dart';
import 'package:g3_project/screens/Home/home.dart';

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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.grey[300],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom +
                kBottomNavigationBarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(16.0),
                      bottomRight: const Radius.circular(16.0),
                    ),
                  ),
                  child: Text(
                    "Leaderboard",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
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
                            vertical: 4.0,
                          ),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ListTile(
                            leading: Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            title: Text(
                              player.name,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            trailing: Text(
                              "${player.score}",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
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
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
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
