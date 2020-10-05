import 'package:flutter/material.dart';
import 'card_image_profile.dart';

class CardImageListProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      //height: 400,
      margin: EdgeInsets.only(
        top: 250,
        //left: 20
      ),
      child: ListView(
        padding: EdgeInsets.all(15),
        scrollDirection: Axis.vertical,//Axis para que el Scroll sea Horizontal
        children: [//Agregamos todos los elementos que estan componiendo la lista
          CardImageProfile("assets/img/mountain.jpeg","Knuckles Mountains Range","Hiking water tall hunting, Natural bath, Scenery y Photography","Steps 123,123,123"),
          CardImageProfile("assets/img/beach.jpeg","Knuckles Mountains Range","Hiking water tall hunting, Natural bath, Scenery y Photography","Steps 123,123,123"),
          CardImageProfile("assets/img/beach_palm.jpeg","Knuckles Mountains Range","Hiking water tall hunting, Natural bath, Scenery y Photography","Steps 123,123,123"),
          CardImageProfile("assets/img/mountain_stars.jpeg","Knuckles Mountains Range","Hiking water tall hunting, Natural bath, Scenery y Photography","Steps 123,123,123"),
          CardImageProfile("assets/img/sunset.jpeg","Knuckles Mountains Range","Hiking water tall hunting, Natural bath, Scenery y Photography","Steps 123,123,123"),
          CardImageProfile("assets/img/river.jpeg","Knuckles Mountains Range","Hiking water tall hunting, Natural bath, Scenery y Photography","Steps 123,123,123"),
        ],
      ),
    );
  }

}