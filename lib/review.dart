import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Nota: heredamos de StatelessWidget que son Widgets sin estado
//Por que no tendra ninguna interacion
class Review extends StatelessWidget {

  String pathImage = "asset/img/people.jpg";
  String name = "Varuna Yasas";
  String details = "1 review 5 photos";
  String comment = "There is an amazing place in Sri Lanka";

  //Creamos nuestro constructor que reciba esa imagen
  Review(this.pathImage, this.name, this.details, this.comment);

  @override
  Widget build(BuildContext context) {

    final userComment = Container(
      margin: EdgeInsets.only(
          left: 12.0
      ),
      //Creamo el hijo que sera el nombre del texto que estara dentro
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
            fontWeight: FontWeight.w900
        ),
      ),
    );

    final userInfo = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      //Creamo el hijo que sera el nombre del texto que estara dentro
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
            color: Color(0xFFa3a5a7)
        ),
      ),
    );

    //Se crea el nombre del usuario
    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),
      //Creamo el hijo que sera el nombre del texto que estara dentro
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 17.0
        ),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,//Alineamos al inicio que es como si se alineara a la izquierda
      children: [//Realizamos la apilacion de nuestros widgets
        userName,
        userInfo,
        userComment
      ],
    );

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
        photo,
        userDetails //userDetails contiene la apilacion de todos los elementos widgets que podemos mostrar
      ],
    );
  }

}