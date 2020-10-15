import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // Retornamos el metodo _FloatingActionButtonGreen que contiene el State que es el metodo que espera un StatefulWidget
    return _FloatingActionButtonGreen();
  }

}

//Una Clase que hereda de StatefulWidget necesita tener otra clase que herede de State
// Para este caso se crea otra case de nombre similia pero con un guion bajo.
//Aqui es donde construimos nuestro Widget
class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  IconData icon = Icons.favorite_border;

  void onPressedFav(){
    setState(() {
      if(this.icon == Icons.favorite_border) {
        this.icon = Icons.favorite;

        Scaffold.of(context).showSnackBar(//Es la accion muestra un evento con el SnackBar
            SnackBar(
              content: Text("Agregaste a tus Favoritos"),
            )
        );

      } else {
        this.icon = Icons.favorite_border;

        Scaffold.of(context).showSnackBar(//Es la accion de muestra un evento con el SnackBar
            SnackBar(
              content: Text("Quitaste a tus Favoritos"),
            )
        );

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // En este caso crearemos un boton
    return FloatingActionButton(
        backgroundColor: Color(0xFF11DA53),
        mini: true,//Tipo de tamaño mini
        tooltip: "Fav", //Si se pasa un el elemento con un mouse
        onPressed: onPressedFav,//Con onPressed agregamos la accion que tendra el metodo al hacer click en este caso ejecuta una funcion
        child: Icon(
          this.icon
        ),
      heroTag: null,//Cuando tenemos muchos FloatingActionButton los Tags se comienzan a duplicar lo recomendable es ponerlo como nulo
    );
  }
}