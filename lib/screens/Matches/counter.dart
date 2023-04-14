import 'package:flutter/material.dart';

class BasketballMatchMarkerScreen extends StatefulWidget {
  const BasketballMatchMarkerScreen({Key? key}) : super(key: key);
  static const String routeName = "/counter";

  @override
  _BasketballMatchMarkerScreenState createState() => _BasketballMatchMarkerScreenState();
}

class _BasketballMatchMarkerScreenState extends State<BasketballMatchMarkerScreen> {
  int _teamAScore = 0;
  int _teamBScore = 0;

  void _addTeamAPoint() {
    setState(() {
      _teamAScore++;
    });
  }

  void _addTeamBPoint() {
    setState(() {
      _teamBScore++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        backgroundColor: Colors.grey,
        title: Text('Basketball Marker'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Team A',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '$_teamAScore',
                            style: const TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey[800],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Team B',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '$_teamBScore',
                            style: const TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _addTeamAPoint,
                    child: const Text('+1', style: TextStyle(fontSize: 24)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: _addTeamBPoint,
                    child: const Text('+1', style: TextStyle(fontSize: 24)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
