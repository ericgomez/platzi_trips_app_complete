import 'package:flutter/material.dart';

class GradientBackProfile extends StatelessWidget {

  //Creamo el titulo de nuestro appBar
  String title = "Popular";

  //Creamos el constructor
  GradientBackProfile(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 400.0,//Definimos la altura
      decoration: BoxDecoration(
          gradient: LinearGradient(//La forma en que queremos que se genere nuestro gradient
              colors: [//Agregamos un arreglo de colores con []
                //Color primero colocamos el tono mas claro al mas oscuro
                Color(0xFF4268D3),
                Color(0xFF584CD1)
              ],
              //Con begin ponemos la orientacion del gradiente y que tanto queremos que se este traslapando con otro
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],//Indicamos la orientacion del gradient en este caso inclinacion
              tileMode: TileMode.clamp //Color por defecto mientras carga el gradiente o en caso de que no carge
          )
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold
              ),
            ),
            FloatingActionButton(
              elevation: 0, //Eliminamos el fondo oscuro del boton flotante
              backgroundColor: Colors.transparent,//Colocam
              foregroundColor: Color(0xFFA7B2E3),
              mini: true,//Tipo de tamaño mini
              tooltip: "Settings", //Si se pasa un el elemento con un mouse
              //onPressed: onPressedFav,
              child: Icon(
                Icons.settings,
                size: 15,
              ),
            ),
          ],
        ),
      ),
      alignment: Alignment(-0.94, -0.84),
    );
  }

}