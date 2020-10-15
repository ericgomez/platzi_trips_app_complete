import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {

  //Creamo el titulo de nuestro appBar
  String title = "Popular";
  //Definimos la altuta
  double height = 0;

  //Creamos el constructor
  GradientBack({Key key, this.height});//Si height = null sera full screen

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //Medimos el tamaño de la pantalla de manera automatica
    double screenHeight = MediaQuery.of(context).size.height;//Obtenemos la altura de manera automatica
    double screenWidth = MediaQuery.of(context).size.width;//Obtenemos el ancho de manera automatica

    if(height == null){
      //Si height es igual a null tomara todo el tamaño del gradiente
      height = screenHeight;
    }

    return Container(
      width: screenWidth,
      height: height,//Definimos la altura dinamica
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
      child: FittedBox(//Realiza la funcion de dibujar un circulo
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -0.8),//Para que solo muestre una parte del circulo
        child: Container(
         width: screenHeight,//colocamos width: screenHeight para que el circulo se posicione a la mitad de la pantalla
         height: screenHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.05),//Damos un grado de opacidad
            borderRadius: BorderRadius.circular(screenHeight / 2)//Creamos un borde a la mitad
          ),
        ),
      ),
      /*Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
      ),*/
      //Pondremos la alineacion del texto
      //alignment: Alignment(-0.9, -0.6),
    );
  }
  
}