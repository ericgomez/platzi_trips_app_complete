import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';

class User {
  final String uid;//Contendra el id del User
  final String name;
  final String email;
  final String photoURL;
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;

  //Definimos un metodo Contructor que me ca a definir los valores minimos requeridos
  User({//Declaramos el constructor con {}
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.myPlaces,
    this.myFavoritePlaces
  });
}