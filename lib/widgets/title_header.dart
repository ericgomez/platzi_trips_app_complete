import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {

  final String title;

  //Inicializamos el constructor
  TitleHeader({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {

    //Creamos la variable con el tamaño de la pantalla de manera automatica
    double screenWidth = (MediaQuery.of(context).size.width)-80;//Obtenemos el ancho de manera automatica

    //Preparamos el titulo para que este a prueba de desbordamiento de texto de la pantalla
    return Flexible(
      child: Container(
        width: screenWidth,
        child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold
            ) ,
        ),
      ),
    );

  }

}