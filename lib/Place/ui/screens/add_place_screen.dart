import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

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

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(
            height: 300,
          ),
          Row(//Este Row contiene nuestro App Bar
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
              Container(//Agregamos el contenedor del texto
                padding: EdgeInsets.only(
                  top: 45,
                  left: 20,
                  right: 10,
                ),
                child: TitleHeader(title: "Add a new Place"),
              )
            ],
          ),
          Container(//Este Container estara preparado para recibir a todos los hijos de la interfas
            margin: EdgeInsets.only(
              top: 120,
              bottom: 20
            ),
            //metemos toda la interfaz de usuario en un listView
            child: ListView(
              children: [
                Container(//Este container contendra la foto

                ),
                Container(//Este container contendra las los TextField del titulo
                  margin: EdgeInsets.only(
                    bottom: 20
                  ),
                  child: TextInput(
                      hintText: "Title", 
                      inputType: null,
                      maxLines: 1, 
                      controller: _controllerTitlePlace
                  ),
                ),
                TextInput(
                    hintText: "Description",
                    inputType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _controllerDescriptionPlace
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}