import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {

  PickedFile image;

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

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
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
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.image.path,
                    iconData: Icons.camera_alt,
                    width: 350,
                    height: 250,
                    left: 0,
                    internet: false,
                  ),
                ),
                Container(//Este container contendra las los TextField del titulo
                  margin: EdgeInsets.only(
                    top: 20,
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
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextInputLocation(
                      hintText: "Add Location",
                      iconData: Icons.location_on,
                      controller: null),
                ),
                Container(//Creamos el boton
                  width: 70,
                    child: ButtonPurple(
                        buttonText: "Add Place",
                        onPressed: () {
                          //ID del usuario qu e esta olgeado actualmente
                          userBloc.currentUser.then((FirebaseUser user) {
                            if (user != null) {//Si user es diferente de null realizamos la subida del archivo
                              String uid = user.uid;
                              String path = "${uid}/${DateTime.now().toString()}.jpg";
                              //1.Firebase Storage
                              //url -
                              userBloc.uploadFile(path, File(widget.image.path))//Convertimos un PickedFile a File con File(image.path);
                                  .then((StorageUploadTask storageUploadTask) {
                                    storageUploadTask.onComplete.then((StorageTaskSnapshot snapshot) {
                                      snapshot.ref.getDownloadURL().then((urlImage) {
                                        print("URLIMAGE: ${urlImage}");

                                        //2. Cloud Firestores
                                        // Insertamom el objeto Place - title, description, url, userOwner, likes
                                        userBloc.updatePlaceData(Place(
                                          name: _controllerTitlePlace.text,
                                          description: _controllerDescriptionPlace.text,
                                          urlImage: urlImage,
                                          likes: 0,
                                        )).whenComplete(() {
                                          //Mostramos un mensaje una vez que termina la subida de datos
                                          print("TERMINO");
                                          Navigator.pop(context);//Como ya no necesitamos la ventana la destruimos
                                        });

                                      });
                                    });
                              });

                            }
                          });//Una vez que termine la consulta me devlvera mi objeto de tipo user
                          //como estoy utilizando en Future puedo utiizar el metodo whenComplete "cuando se complete"
                        }
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}