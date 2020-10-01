import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 350,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,//Axis para que el Scroll sea Horizontal
        children: [//Agregamos todos los elementos que estan componiendo la lista
          CardImage("assets/img/mountain.jpeg"),
          CardImage("assets/img/beach.jpeg"),
          CardImage("assets/img/beach_palm.jpeg"),
          CardImage("assets/img/mountain_stars.jpeg"),
          CardImage("assets/img/sunset.jpeg"),
          CardImage("assets/img/river.jpeg"),
        ],
      ),
    );
  }

}