import 'package:flutter/material.dart';

//Nota: heredamos de StatelessWidget que son Widgets sin estado
//Por que no tendra ninguna interacion
class Review extends StatelessWidget {

  String pathImage = "asset/img/people.jpg";

  //Creamos nuestro constructor que reciba esa imagen
  Review(this.pathImage);

  @override
  Widget build(BuildContext context) {

    //Creamos variable Photo
    final photo = Container (
      margin: EdgeInsets.only(//Manejamos unos margenes
        top: 20.0,
        left: 20.0
      ),
      //Definimos el ancho y el alto que queremos que tenga esa foto
      width: 80.0,
      height: 80.0,

      decoration: BoxDecoration(
        //shape es que forma quiero que tenga ese contenedor
        shape: BoxShape.circle,
        image: DecorationImage(//Para funcionar el AssetImage necesita estar dentro de un DecorationImage
          fit: BoxFit.fill,//Con fit indicamos la posicion de la imagen dentro del contenedor
          image: AssetImage(pathImage)//Agregamoe la direccion de la foto con AssetImage
        )
      ),
    );
    //Creamos un Row
    return Row(//Recordemos que le Row lleva hijos
      children: [

      ],
    );
  }

}