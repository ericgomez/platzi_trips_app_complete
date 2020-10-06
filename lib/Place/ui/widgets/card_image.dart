import 'package:flutter/material.dart';
import 'floating_action_button_green.dart';

class CardImage extends StatelessWidget {

  String pathImage = "assets/img/beach.jpeg";
  
  //Creamos nuestro constructor
  CardImage(this.pathImage);

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: 350.0,
      width: 250.0,
      margin: EdgeInsets.only(
        top: 80,
        left: 20
      ),

      //Agregamos la decoracion como imagen
      decoration: BoxDecoration(
        image:DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(pathImage)
        ),
            //Asemos que la imagen sea redonda
            borderRadius: BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,//Haacemos que la imagen sea rectangular
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
        FloatingActionButtonGreen()//Mandamos llamar nuestro metodo que viene de la clase exportada floating_action_button_green
      ],
    );
  }
  
}