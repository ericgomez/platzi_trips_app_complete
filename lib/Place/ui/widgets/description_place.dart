import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {

  String namePlace;//Nombre del sitio
  int stars;//Numero de estrellas para el sitio
  String descriptionPlace;//Descripcion del sitio

  //Contructor en Dart
  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace );

  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    // Widget para representar las estrellas vacias
    final star_border = Container(
      margin: EdgeInsets.only(
          top: 353.0,//Posision en la pantalla
          right: 3.0
      ),

      child: Icon(
        Icons.star_border,
        color: Color(0xFFF2C611),
      ),
    );

    // Widget para representar las estrellas a la mitad
    final star_half = Container(
      margin: EdgeInsets.only(
          top: 353.0,//Posision en la pantalla
          right: 3.0
      ),

      child: Icon(
        Icons.star_half,
        color: Color(0xFFF2C611),
      ),
    );

    // Widget para reprecentas las estrellas llenas
    final star = Container(
      margin: EdgeInsets.only(
        top: 353.0,//Posision en la pantalla
        right: 3.0
      ),

      child: Icon(
        Icons.star,
        color: Color(0xFFF2C611),
      ),
    );

    return StreamBuilder<Place>(
      stream: userBloc.placeSelectedStream,
      builder: (BuildContext context, AsyncSnapshot<Place> snapshot){
        if (snapshot.hasData) {
          print("PLACE SELECTED: ${snapshot.data.name}");
          Place place = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titleStars(place),
              descriptionWidget(place.description),
              ButtonPurple(buttonText: "Navigate", onPressed: (){})
            ],
          );
        }else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container (
                margin: EdgeInsets.only(
                    top: 400.0,
                    left: 20.0,
                    right: 20.0
                ),

                child: Text(
                  "Selecciona un lugar",
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900
                  ),
                  textAlign: TextAlign.left,
                ),

              )

            ],
          );
        }
      },
    );

  }


  Widget titleStars(Place place){
    return Row (
      children: <Widget>[
        Container (
          margin: EdgeInsets.only(
              top: 350.0,
              left: 20.0,
              right: 20.0
          ),

          child: Text(
            place.name,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 30.0,
                fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),

        ),
        Container (
          margin: EdgeInsets.only(
            top: 370.0,
          ),

          child: Text(
            "Hearts: ${place.likes}",
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: Colors.amber
            ),
            textAlign: TextAlign.left,
          ),

        ),

      ],
    );
  }

  Widget descriptionWidget(String descriptionPlace){
    return Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: new Text(
        descriptionPlace,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),

      ),
    );
  }
  
}