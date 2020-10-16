import 'dart:io';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {

  UserBloc userBloc;//Declaramos el objeto userBloc

  //Creamos la Instancia del ImagePicker
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {

    //Inicializamos el objeto con userBloc
    userBloc = BlocProvider.of(context);

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: [
            CircleButton(true, Icons.turned_in_not, 20.0, Color.fromRGBO(255, 255, 255, 1), () => {}),
            CircleButton(true, Icons.card_travel, 20.0, Color.fromRGBO(255, 255, 255, 0.6),() => {}),
            //Añadiremos un nuevo lugar
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1),
                    () {//Si eliminamos la fecha podemos insertar mas de una linea de codigo

                        //Este metodo devuelven a PickedFile
                        _picker.getImage(source: ImageSource.camera)//ImageSource.camera se abre la camara se puede tomar la photo
                            .then((PickedFile image) {//capturamos el elemento image y no devuelve en elemento de tipo PickedFile
                                //Con el metodo push cambiamos de pantalla principal po otra
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: image)));
                            }).catchError((onError) => print(onError));//En caso de exitir algun error

                      }),
            //Cambiaremos la contraseña
            CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
                    () => {}),
            //Cerrar Session
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
                    () => {
                      userBloc.signOut()
                    })
          ],
        )
    );
  }

}