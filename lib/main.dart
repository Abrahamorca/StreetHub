import 'dart:js';

import 'package:flutter/material.dart';
import 'package:g3_project/screens/Home/home.dart';
import 'package:g3_project/screens/Login/login.dart';
import 'package:g3_project/screens/loading.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
    );
  }
}

// EJEMPLO
// @override
//   Widget buildSuggestions(BuildContext context) {
//     // Son las sugerencias que aparecen cuando la persona escribe
//     if (query.isEmpty) {
//       return Container();
//     }

//     return FutureBuilder(
//       future: peliculasProvider.buscarActor(query),
//       builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
//         if (snapshot.hasData) {
//           final peliculas = snapshot.data;

//           return ListView(
//               children: peliculas.map((pelicula) {
//             return ListTile(
//               leading: FadeInImage(
//                 image: NetworkImage(pelicula.getFoto()),
//                 placeholder: AssetImage('assets/img/no-image.jpg'),
//                 width: 50.0,
//                 fit: BoxFit.contain,
//               ),
//               title: Text(pelicula.name),
//               onTap: () {
//                 close(context, null);
//                 pelicula.creditId = '';
//                 Navigator.pushNamed(context, 'detalle', arguments: pelicula);
//               },
//             );
//           }).toList());
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }