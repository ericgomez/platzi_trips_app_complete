import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {

  //Creamo el titulo de nuestro appBar
  String title = "Popular";

  //Creamos el constructor
  GradientBack(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 250.0,//Definimos la altura
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
      //Creamos un nuevo hijo
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
      ),
      //Pondremos la alineacion del texto
      alignment: Alignment(-0.9, -0.6),
    );
  }
  
}