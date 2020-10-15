import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {

  final String hintText;//los hint corresponden a las pistas que llevara dentro la caja de texto
  final TextEditingController controller;//Para poder editar el formulario
  final IconData iconData;//Almacenara el icono

  TextInputLocation({//Creamos nuestro constructor
    Key key,
    @required this.hintText,
    @required this.iconData,
    @required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 20,
        left: 20
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 15,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),
        //Decoracion del input
        decoration: InputDecoration(
          hintText: hintText,//El hintText es el texto en forma de pista de lo que se debe capturar
          suffixIcon: Icon(iconData),//El prefix: prefixIcon coloca el icono del lado izquierda y suffixIcon coloca el icono a la derecha
          fillColor: Color(0xFFFFFFFF),//Color del llenado
          filled: true,//Habilitamos que este activo el llenado
          // Cuando el input esta activo tendra ciertas caracteristicas
          border: InputBorder.none,
            enabledBorder: OutlineInputBorder(//Aun que definimo que no tenga borde podemos definir bordes de un lado en especifico
                borderSide: BorderSide(
                    color: Color(0xFFFFFFFF)
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))//Borde los mas circular posible
            ),
            // Cuando el input esta enfocado tendra ciertas caracteristicas
            focusedBorder: OutlineInputBorder(//Cuando el input Text este enfocado o selecionado tendra un comportamiento diferente
                borderSide: BorderSide(//podemos agregar un color diferente de requerirlo
                    color: Color(0xFFFFFFFF)
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))//Borde los mas circular posible
            )
        ),
      ),

      decoration: BoxDecoration(
        //Trabajaremos con la sombra
        boxShadow: <BoxShadow> [//Creamos el boxShadow y le indicamos entre <> el parametro que va a recibir
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: Offset(0.0, 7.0)//Corresponde a la posicion de la sombra
          )
        ]
      ),
    );
  }
  
}