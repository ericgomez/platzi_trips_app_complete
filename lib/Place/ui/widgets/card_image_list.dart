import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = 300;
    double height = 350;
    double left = 10;

    return Container(
      height: 350,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,//Axis para que el Scroll sea Horizontal
        children: [//Agregamos todos los elementos que estan componiendo la lista
          CardImageWithFabIcon(pathImage: "assets/img/mountain.jpeg", iconData: Icons.favorite_border, width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/beach.jpeg", iconData: Icons.favorite_border, width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/beach_palm.jpeg", iconData: Icons.favorite_border, width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/mountain_stars.jpeg", iconData: Icons.favorite_border, width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/sunset.jpeg", iconData: Icons.favorite_border, width: width, height: height, left: left),
          CardImageWithFabIcon(pathImage: "assets/img/river.jpeg", iconData: Icons.favorite_border, width: width, height: height, left: left),
        ],
      ),
    );
  }

}