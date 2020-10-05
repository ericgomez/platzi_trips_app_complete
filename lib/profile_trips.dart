import 'package:flutter/material.dart';
import 'package:platzi_trips_app/review_list.dart';
import 'description_place.dart';
import 'header_appbar_profile.dart';
import 'floating_action_button_profile.dart';


class ProfileTrips extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(//un Stack permite colocar un elemento encima de otro
      children: [//En Stack tambien agregamos hijos
        ListView(//Enviamos nuestro contenido en forma de lista para que podamos utilizar el scroll
          children: [//Agrupamos los elemento
            //ReviewList(),
          ],
        ),
        HeaderAppBarProfile(),
        FloatingActionButtonProfile()

      ],
    );
  }

}