import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TextInput extends StatelessWidget {

  final String hintText;//los hint corresponden a las pistas que llevara dentro la caja de texto
  final TextInputType inputType;
  final TextEditingController controller;//Para poder editar el formulario
  int maxLines = 1;

  TextInput({
    Key key,
    @required this.hintText,
    @required this.inputType,
    @required this.controller,
    this.maxLines
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
        keyboardType: inputType,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 15,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          filled: true,//Tenga la posibilidad de ser llenado
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(//Aun que definimo que no tenga borde podemos definir bordes de un lado en especifico
            borderSide: BorderSide(
              color: Color(0xFFe5e5e5)
            ),
            borderRadius: BorderRadius.all(Radius.circular(9))//Borde los mas circular posible
          ),
          focusedBorder: OutlineInputBorder(//Cuando el input Text este enfocado o selecionado tendra un comportamiento diferente
              borderSide: BorderSide(//podemos agregar un color diferente de requerirlo
                  color: Color(0xFFe5e5e5)
              ),
              borderRadius: BorderRadius.all(Radius.circular(9))//Borde los mas circular posible
          )
        ),
      ),
    );
  }
}