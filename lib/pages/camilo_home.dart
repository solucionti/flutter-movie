import 'package:flutter/material.dart';
import 'package:peliculas/providers/peliculas_provider.dart';

class CamiloClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final peliculasProvider = new PeliculasProvider();
    final  peliculasCines=peliculasProvider.getEnCines();
    return Scaffold(
        body: Stack(children: <Widget>[
      CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      )
    ]));
  }

  Widget _headerContent() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Dashboard',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(255, 255, 255, 1)),
                  )),
              Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('14 Items',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromRGBO(255, 255, 255, 1)))),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: Column(
              children: <Widget>[
                Image(
                  height: 150.0,
                  width: 150.0,
                  image: NetworkImage(
                      'https://mouse.latercera.com/wp-content/uploads/2019/03/avengers-2.jpg'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _contenedorContenido() {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('He\'d have you all unravel at the'),
                color: Colors.green[100],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Heed not the rabble'),
                color: Colors.green[200],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Sound of screams but the'),
                color: Colors.green[300],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Who scream'),
                color: Colors.green[400],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Revolution is coming...'),
                color: Colors.green[500],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Revolution, they...'),
                color: Colors.green[600],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
