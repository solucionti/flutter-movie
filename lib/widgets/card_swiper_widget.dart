import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screeSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {

          peliculas[index].uniqueId='${peliculas[index].id}-tarjeta';
          return Hero(
            tag:  peliculas[index].uniqueId,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detalle',
                        arguments: peliculas[index]);
                  },
                  child: FadeInImage(
                    image: NetworkImage(peliculas[index].getPosterImg()),
//                placeholder: NetworkImage(
//                    'https://image.shutterstock.com/image-vector/not-available-grunge-rubber-stamp-260nw-549465907.jpg'),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                  ),
                )),
          );
        },
        itemCount: peliculas.length,
        itemWidth: _screeSize.width * 0.6,
        itemHeight: _screeSize.height * 0.5,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
