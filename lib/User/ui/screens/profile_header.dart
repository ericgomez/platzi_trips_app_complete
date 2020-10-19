import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/user_info.dart';
import 'package:platzi_trips_app/User/ui/widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {

  User user; //Creamos el Objeto User

  ProfileHeader({Key key, @required this.user});

  @override
  Widget build(BuildContext context) {

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
          UserInfo(user),//Enviamos el objeto user
          ButtonsBar()
        ],
      ),
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