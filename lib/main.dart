import 'package:flutter/material.dart';
import 'package:peliculas/pages/camilo_home.dart';
import 'package:peliculas/pages/home_page.dart';
import 'package:peliculas/pages/pelicula_detalle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => CamiloClass(),
        'detalle': (BuildContext context) => PeliculaDetalle(),
      },
    );
  }
}
