import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class AddPlaceScreen extends StatefulWidget {

  File image;

  //Creamos el constructor
  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          GradientBack(
            height: 300,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(//Separacion de la pantalla
                    top: 25,
                    left: 5
                ),
                child: SizedBox(//SizedBox me permitira definir el tamaño del area que sera clickable
                  height: 45,
                  width: 45,
                  child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 45,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}