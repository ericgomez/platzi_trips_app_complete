import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {

  UserBloc userBloc;//Creamos el metodo UserBloc

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      height: 350,
      child: StreamBuilder(//StreamBuilder Para estar alerta cuando al informacion sufra algun cambio
          stream: userBloc.placesStream,//nos trae toda la lista de lugares
          builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {//Por medio del switch estaresmos revisando o monitoreando la coneccion
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents));
                case ConnectionState.done:
                  return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents));
                case ConnectionState.none:
                  return CircularProgressIndicator();
                default:
                  return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents));

              }
          }
      ),
    );
  }

  //Creamos un metodo que genera la lista de imagenes de la pagina Home
  Widget  listViewPlaces(List<CardImageWithFabIcon> placesCard) {
    return ListView(
      padding: EdgeInsets.all(25),
      scrollDirection: Axis.horizontal,//Axis para que el Scroll sea Horizontal
      children: placesCard,
    );
  }

}