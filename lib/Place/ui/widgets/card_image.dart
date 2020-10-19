import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardImageWithFabIcon extends StatelessWidget {

  //Declaracion de Variables
  final double height;//Declaramos como final los elementos que van a ser requeridos
  final double width;//Declaramos como final los elementos que van a ser requeridos
  double left;
  final String pathImage;//Declaramos como final los elementos que van a ser requeridos
  final VoidCallback onPressedFabIcon;//Declaramos como final los elementos que van a ser requeridos
  final IconData iconData;
  bool internet = true;//lag que nos permita distinguir si la imagen que mostraremos en el Card viene de internet o es un Asset
  
  //Creamos nuestro constructor
  CardImageWithFabIcon({
    Key key,
    //Una variable requerida no puede ser inicializada
    @required this.pathImage,
    @required this.width,
    @required this.height,
    @required this.onPressedFabIcon,
    @required this.iconData,
    this.internet,
    this.left
  });

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: left
      ),

      //Agregamos la decoracion como imagen
      decoration: BoxDecoration(
        image:DecorationImage(
            fit: BoxFit.cover,
            //image: NetworkImage(pathImage)//NetworkImage(pathImage) para mostrar la imagen atravez de interner o AssetImage(pathImage) de manera local
            //image: pathImage.contains('assets') ? AssetImage(pathImage) : FileImage(new File(pathImage)),
            image: internet?CachedNetworkImageProvider(pathImage):AssetImage(pathImage)//CachedNetworkImageProvider permitirá utilizar el cache para optimizar la carga de las imagenes
            //image: pathImage.contains('http')? NetworkImage(pathImage): FileImage(File(pathImage))
        ),
            //Asemos que la imagen sea redonda
            borderRadius: BorderRadius.all(Radius.circular(10)),
        //shape: BoxShape.rectangle,//Haacemos que la imagen sea rectangular
        boxShadow: <BoxShadow>[//Agregamos una sombra
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,//Que tan degradado quiero que quede
            offset: Offset(0,7)//la posicion de la sombra en X y en Y
          )
        ]
      ),
    );

    //Devolvemos la imagen
    return Stack(
      alignment: Alignment(0.9,1.1),
      children: [
        card,
        FloatingActionButtonGreen(iconData: iconData,onPressed: onPressedFabIcon,)//Mandamos llamar nuestro metodo que viene de la clase exportada floating_action_button_green
      ],
    );
  }
  
}