import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/user_info.dart';
import 'package:platzi_trips_app/User/ui/widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {

  UserBloc userBloc; //Creamos el Objeto UserBloc
  User user; //Creamos el Objeto User

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.streamFirebase,//Primero definimos el flujo de datos a consultar
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot) { //Que cosa es lo que tengo que ejecutar
          switch (snapshot.connectionState) { //--------Verificamos el estado de la conexion
            case ConnectionState.waiting://En caso de que aun no se aya cargado la informacion retornamos un progreso circular
              return CircularProgressIndicator();
            case ConnectionState.none://En caso de que aun no se aya nada de informacion retornamos un progreso circular
              return CircularProgressIndicator();
            case ConnectionState.active://En caso de que la conexion se activa
              return showProfileData(snapshot);//Retornamos al Widget showProfileData con el parametro snapshot
            case ConnectionState.done://En caso de que la conexion de terminada
              return showProfileData(snapshot);//Retornamos al Widget showProfileData con el parametro snapshot
          }
        }
    );
  }

  //Validamos que el objeto snapshot tenga Datos del StreamBuilder
  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No logeado");
      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la informacion. Haz login")
          ],
        ),
      );
    } else {
      print("Logeado");

      print(snapshot.data);
      user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoURL: snapshot.data.photoUrl);

      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        ),
      );

      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title
              ],
            ),
            UserInfo(user),//Pasamos el objeto entero de user porque user UserInfo ya esta preparado para recibir ese objeto
            ButtonsBar()
          ],
        ),
      );
    }

  }

}