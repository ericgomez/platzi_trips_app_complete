import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class CardImageList extends StatefulWidget {

  User user;//Creamos el metodo User

  //Creamos el metodo Constructor
  CardImageList(@required this.user);

  @override
  State<StatefulWidget> createState() {
    return _CardImageList();
  }

}

class _CardImageList extends State<CardImageList> {

  UserBloc userBloc;//Creamos el metodo User

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
                print("PLACESLIST: WAITING");
                return CircularProgressIndicator();
              case ConnectionState.active:
                print("PLACESLIST: ACTIVE");
                return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents, widget.user));
              case ConnectionState.done:
                print("PLACESLIST: DONE");
                return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents, widget.user));
              case ConnectionState.none:
                print("PLACESLIST: NONE");
                return CircularProgressIndicator();
              default:
                print("PLACESLIST: DEFAULT");
                return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents, widget.user));

            }
          }
      ),
    );
  }

  Widget listViewPlaces(List<Place> places){

    void setLiked(Place place){
      setState(() {
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
      });
    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place){
        return CardImageWithFabIcon(
          pathImage: place.urlImage,
          width: 300.0,
          height: 250.0,
          left: 20.0,
          iconData: place.liked?iconDataLiked:iconDataLike,
          onPressedFabIcon: (){
            setLiked(place);
          },
          //internet: true,
        );
      }).toList(),
    );
  }

}