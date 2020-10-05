import 'package:flutter/material.dart';

class FloatingActionButtonProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // Retornamos el metodo _FloatingActionButtonGreen que contiene el State que es el metodo que espera un StatefulWidget
    return _FloatingActionButtonProfile();
  }

}

//Una Clase que hereda de StatefulWidget necesita tener otra clase que herede de State
// Para este caso se crea otra case de nombre similia pero con un guion bajo.
//Aqui es donde construimos nuestro Widget
class _FloatingActionButtonProfile extends State<FloatingActionButtonProfile> {

  @override
  Widget build(BuildContext context) {
    // En este caso crearemos un boton
    //Witget Marcador
    final button_mark = Container(
      margin: EdgeInsets.only(
          top: 200.0,//Posision en la pantalla
      ),

      child: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF584CD1),
        mini: true,//Tipo de tamaño mini
        tooltip: "Fav", //Si se pasa un el elemento con un mouse
        //onPressed: onPressedFav,
        child: Icon(
            Icons.bookmark_border
        ),
      ),
    );

    final button_tv = Container(
      margin: EdgeInsets.only(
          top: 200.0,//Posision en la pantalla
      ),

      child: FloatingActionButton(
        backgroundColor: Color(0xFFA7B2E3),
        foregroundColor: Color(0xFF584CD1),
        mini: true,//Tipo de tamaño mini
        tooltip: "Fav", //Si se pasa un el elemento con un mouse
        //onPressed: onPressedFav,
        child: Icon(
            Icons.tv
        ),
      ),
    );

    final button_add = Container(
      margin: EdgeInsets.only(
          top: 200.0,//Posision en la pantalla
      ),

      child: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF584CD1),
        //mini: true,//Tipo de tamaño mini
        tooltip: "Fav", //Si se pasa un el elemento con un mouse
        //onPressed: onPressedFav,
        child: Icon(
            Icons.add
        ),
      ),
    );

    final button_email = Container(
      margin: EdgeInsets.only(
          top: 200.0,//Posision en la pantalla
      ),

      child: FloatingActionButton(
        backgroundColor: Color(0xFFA7B2E3),
        foregroundColor: Color(0xFF584CD1),
        mini: true,//Tipo de tamaño mini
        tooltip: "Fav", //Si se pasa un el elemento con un mouse
        //onPressed: onPressedFav,
        child: Icon(
            Icons.email
        ),
      ),
    );

    final button_people = Container(
      margin: EdgeInsets.only(
          top: 200.0,//Posision en la pantalla
      ),

      child: FloatingActionButton(
        backgroundColor: Color(0xFFA7B2E3),
        foregroundColor: Color(0xFF584CD1),
        mini: true,//Tipo de tamaño mini
        tooltip: "Fav", //Si se pasa un el elemento con un mouse
        //onPressed: onPressedFav,
        child: Icon(
            Icons.person
        ),
      ),
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,//Coloque el espacio libre de manera uniforme entre los hijos, así como la mitad de ese espacio antes y después del primer y último hijo
          children: [
            button_mark,
            button_tv,
            button_add,
            button_email,
            button_people
          ],
        )
      ],
    );
  }
}