import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String photoURL;

  //Definimos un metodo Contructor que me ca a definir los valores minimos requeridos
  User({//Declaramos el constructor con {}
    Key key,
    @required this.name,
    @required this.email,
    @required this.photoURL,
  });
}