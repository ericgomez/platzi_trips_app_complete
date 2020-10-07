import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
 //Todo elemento que se a de tipo @required debe ser de tipo final
  final String text;
  double width = 0;
  double height = 0;

  //Declarando una variable de tipo VoidCallback puede recibir una funcion como parametro
  final VoidCallback onPressed;

  //Creamos el metodo constructor ButtonGreen que sea generico que permita agregar elementos requeridos
  ButtonGreen({Key key, @required this.text, @required this.onPressed, this.height, this.width});

  @override
  State<StatefulWidget> createState() {
    return _ButtonGreen();
  }
}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      //Para acceder a un elemento de otra clase lo hacemos con el elemento widget
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20
        ),
        height: widget.height,//Para acceder a un elemento de otra clase lo hacemos con el elemento widget
        width: widget.width,//Para acceder a un elemento de otra clase lo hacemos con el elemento widget
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),//Que tan redondo
            gradient: LinearGradient(
                colors: [
                  Color(0xFFa7ff84),//Color que va arriba
                  Color(0xff1cbb78)//Color de va a bajo
                ],
                begin: FractionalOffset(0.2, 0.0),//Permite que tanto quiero que los colores del gradient se unan o se entrelasen
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp
            )
        ),
        child: Center(
          child: Text(
            widget.text,//Para acceder a un elemento de otra clase lo hacemos con el elemento widget
            style: TextStyle(
                fontSize: 18,
                fontFamily: "Lato",
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
  
}