import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:g3_project/routes.dart';
import 'package:g3_project/screens/Home/score.dart';
import 'package:g3_project/screens/Home/search.dart';
import 'package:g3_project/screens/Settings/settings.dart';
import 'package:g3_project/screens/Matches/options_match.dart';
import 'package:g3_project/screens/Settings/main_settings.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationData? _locationData;
  int _selectedIndex= 0;
  StreamSubscription? _locationSubscription;
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _locationSubscription?.cancel();
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    try {
      final currentLocation = await location.getLocation();
      setState(() {
        _locationData = currentLocation;
      });

      _locationSubscription = location.onLocationChanged.listen((newLocation) {
        setState(() {
          _locationData = newLocation;
        });
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error getting current location: $e');
      }
    }
  }

  void _onItemTapped(int index) {
    const List<Widget> screens = [
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
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  void _onLocationButtonPressed() {
    if (_locationData != null) {
      _mapController.move(
        LatLng(_locationData!.latitude!, _locationData!.longitude!),
        13.0,
      );
    }
  }



  List<Map<String, dynamic>> basketballCourts = [
    {
      'name': 'Pista de bàsquet de la Sagrada Família',
      'lat': 41.404927,
      'lng': 2.175938,
      'info': 'Pista de bàsquet de la Sagrada Família és una pista molt ben ubicada i accessible.'
    },
    {
      'name': 'Pista de bàsquet del Parc de la Creueta del Coll',
      'lat': 41.425244,
      'lng': 2.149289,
      'info': 'Pista de bàsquet del Parc de la Creueta del Coll és una pista situada en un parc amb molts serveis.'
    },
    {
      'name': 'Pista de bàsquet del Parc de la Pegaso',
      'lat': 41.434442,
      'lng': 2.196001,
      'info': 'Pista de bàsquet del Parc de la Pegaso és una pista situada en un parc tranquil.'
    },
    {
      'name': 'Pista de bàsquet del Parc de l\'Espanya Industrial',
    'lat': 41.375703,
      'lng': 2.149489,
      'info': 'Pista de bàsquet del Parc de l\'Espanya Industrial és una pista ben equipada.'
    },
    {
      'name': 'Pista de bàsquet de la Barceloneta',
      'lat': 41.3809186,
      'lng': 2.1936737,
      'info': 'Pista de bàsquet de la Barceloneta és una de les pistes més populars a prop del mar.'
    },
    {
      'name': 'Pista de bàsquet del Parc de la Zona Franca',
      'lat': 41.356855,
      'lng': 2.126455,
      'info': 'Pista de bàsquet del Parc de la Zona Franca és una pista ben ubicada i accessible.'
    },
    {
      'name': 'Pista de bàsquet del Parc de les Aigües',
      'lat': 41.413491,
      'lng': 2.143692,
      'info': 'Pista de bàsquet del Parc de les Aigües és una pista situada en un parc amb molts serveis.'
    },
    {
      'name': 'Pista de bàsquet del Parc de les Rieres',
      'lat': 41.402418,
      'lng': 2.172109,
      'info': 'Pista de bàsquet del Parc de les Rieres és una pista ben equipada i neta.'
    },
    {
      'name': 'Pista de bàsquet de la Mar Bella',
      'lat': 41.4080486,
      'lng': 2.2180109,
      'info': 'Pista de bàsquet de la Mar Bella és coneguda per ser una de les més grans de Barcelona.'
    },
    {
      'name': 'Pista de bàsquet de Sants',
      'lat': 41.3773509,
      'lng': 2.1393465,
      'info': 'Pista de bàsquet de Sants és un lloc popular per als amants del bàsquet.'
    },
    {
      'name': 'Pista de bàsquet del Parc de la Ciutadella',
      'lat': 41.3897372,
      'lng': 2.1849918,
      'info': 'Pista de bàsquet del Parc de la Ciutadella és una de les pistes més cèntriques de la ciutat.'
    },
    {
      'name': 'Pista de bàsquet del Parc de la Trinitat',
      'lat': 41.440535,
      'lng': 2.209355,
      'info': 'Pista de bàsquet del Parc de la Trinitat és una pista gran amb moltes opcions per jugar a bàsquet.'
    },
    {
      'name': 'Pista de bàsquet de la Barceloneta 2',
      'lat': 41.381396,
      'lng': 2.197228,
      'info': 'Pista de bàsquet de la Barceloneta 2 és una pista petita però acollidora.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Marker> basketballMarkers = basketballCourts.map((court) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(court['lat'], court['lng']),
        builder: (ctx) => GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(court['name']),
                  content: Text(court['info']), // aquí es pot afegir informació addicional
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, Routes.game);
                    }, child: Text('Iniciar partit')),
                    TextButton(
                      child: const Text('Tancar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.location_pin, color: Colors.orange, size: 30,),
        ),
      );
    }).toList();

    return Scaffold(
      body: _locationData == null
          ? const Center(
        child: CircularProgressIndicator(color: Colors.orange),
      )
          : FlutterMap(
        options: MapOptions(
          center:
          LatLng(_locationData!.latitude!, _locationData!.longitude!),
          minZoom: 5,
          maxZoom: 18,
          zoom: 13,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
            'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                    _locationData!.latitude!, _locationData!.longitude!),
                builder: (ctx) => const Icon(Icons.person_pin, color: Colors.black, size: 30,),
              ),
             ...basketballMarkers,
            ],
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
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
