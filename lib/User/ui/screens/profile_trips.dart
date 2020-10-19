import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'profile_header.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_places_list.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_background.dart';

class ProfileTrips extends StatelessWidget {

  UserBloc userBloc;//nos da acceso a los casos de uso

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    userBloc = BlocProvider.of<UserBloc>(context);
    
    return StreamBuilder(//StreamBuilder Para generar la peticion
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return showProfileData(snapshot);
            case ConnectionState.done:
              return showProfileData(snapshot);
            case ConnectionState.none:
              return CircularProgressIndicator();
            default:
              return showProfileData(snapshot);

          }
        },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {//Metodo que trae todos los datos del usuario
    if(!snapshot.hasData || snapshot.hasError) {
      print("No logeado");
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
             Text("Usuario no logeado. Haz Login")
            ],
          ),
        ],
      );
    } else {
      print("Logeado");
      var user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl
      );

      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(user: user),//User datos
              ProfilePlacesList(user: user)//User uid
            ],
          ),
        ],
      );
    }
  }

}