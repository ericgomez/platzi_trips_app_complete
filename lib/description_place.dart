import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget {

  String namePlace;//Nombre del sitio
  int stars;//Numero de estrellas para el sitio
  String descriptionPlace;//Descripcion del sitio

  //Contructor en Dart
  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace );

  @override
  Widget build(BuildContext context) {

    // Widget para representar las estrellas vacias
    final star_border = Container(
      margin: EdgeInsets.only(
          top: 323.0,//Posision en la pantalla
          right: 3.0
      ),

      child: Icon(
        Icons.star_border,
        color: Color(0xFFF2C611),
      ),
    );

    // Widget para representar las estrellas a la mitad
    final star_half = Container(
      margin: EdgeInsets.only(
          top: 323.0,//Posision en la pantalla
          right: 3.0
      ),

      child: Icon(
        Icons.star_half,
        color: Color(0xFFF2C611),
      ),
    );

    // Widget para reprecentas las estrellas llenas
    final star = Container(
      margin: EdgeInsets.only(
        top: 323.0,//Posision en la pantalla
        right: 3.0
      ),

      child: Icon(
        Icons.star,
        color: Color(0xFFF2C611),
      ),
    );


    //Witget del Titulo
    final title_stars = Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0,
          ),

          child: Text(
            namePlace,
            style: TextStyle(
              //Utilizamos Google Fonts en pubspec.yaml para poder utilizar fontFamily
              fontFamily: "Lato",
                fontSize: 30.0,
                fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,

          ),
        ),

        Row(
          children: [
            star,//Iconos de estrellas
            star,
            star,
            star,
            star_border
          ],
        )
      ],
    );
    //Creamo el contenido del texto
    final description = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          right: 20.0,
          left: 20.0
      ),
      child: Text(
        //Agregamos el texto para que se muetres en pantalla
        descriptionPlace,
      style: TextStyle(
        //Utilizamos Google Fonts en pubspec.yaml para poder utilizar fontFamily
        fontFamily: "Lato",
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF56575a)
      ),
      ),
    );

    //Pare poder retornar lo almacenamos como una columna
    return Column(
      children: [
        title_stars,
        description
      ],
    );
  }
  
}