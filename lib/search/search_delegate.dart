import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula_model.dart';
import 'package:peliculas/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  final peliculasProviders = new PeliculasProvider();
  String seleccion = '';
  final peliculas = ['Spiderdemna1', 'Capitan amaerica2'];

  final peliculasRecientes = ['Spiderdemna', 'Capitan amaerica'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones del appbar, cancelar, buscar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder de resultados
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.white,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProviders.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data;
          return ListView(
              children: peliculas.map((pelicula) {
            return ListTile(
              leading: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-img.jpg'),
                width: 50.0,
                fit: BoxFit.contain,
              ),
              title: Text(pelicula.title),
              subtitle: Text(pelicula.originalTitle),
              onTap: (){
                close( context, null);
                pelicula.uniqueId = '';
                Navigator.pushNamed(context, 'detalle', arguments: pelicula);
              },
            );
          }).toList());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

//  @override
//  Widget buildResults(BuildContext context) {
//    // Builder de resultados
//    return Center(
//      child: Container(
//        height: 100.0,
//        width: 100.0,
//        color: Colors.white,
//        child: Text(seleccion),
//      ),
//    );
//  }
//
//  @override
//  Widget buildSuggestions(BuildContext context) {
//    // Son las sugerencias que apaprecen
//
//    final listaSugerida = (query.isEmpty)
//        ? peliculasRecientes
//        : peliculas
//            .where((element) =>
//                element.toLowerCase().startsWith((query.toLowerCase())))
//            .toList();
//
//    return ListView.builder(
//      itemBuilder: (context, i) {
//        return ListTile(
//          leading: Icon(Icons.movie),
//          title: Text(listaSugerida[i]),
//          onTap: () {
//            seleccion = listaSugerida[i];
//            showResults(context);
//          },
//        );
//      },
//      itemCount: listaSugerida.length,
//    );
//  }
}
