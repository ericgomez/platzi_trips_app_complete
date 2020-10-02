import 'package:flutter/material.dart';
import 'package:platzi_trips_app/review_list.dart';
import 'description_place.dart';
import 'header_appbar.dart';


class HomeTrips extends StatelessWidget {

  //Declaracion de un String
  String descriptionDummy = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras accumsan, orci vel pulvinar finibus, risus dui pharetra quam, vitae consequat massa ligula sit amet sapien. Quisque pulvinar ultricies urna, id varius ligula mattis ut. In tincidunt vel sem at convallis. Proin eget purus facilisis, fermentum erat ac, tincidunt neque.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Cras accumsan, orci vel pulvinar finibus, risus dui pharetra quam, vitae consequat massa ligula sit amet sapien. Quisque pulvinar ultricies urna, id varius ligula mattis ut.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(//un Stack permite colocar un elemento encima de otro
      children: [//En Stack tambien agregamos hijos
        ListView(//Enviamos nuestro contenido en forma de lista para que podamos utilizar el scroll
          children: [//Agrupamos los elementos
            DescriptionPlace("Bahamas", 4, descriptionDummy),
            ReviewList()
          ],
        ),
        //GradientBack("Popular")//Mandamos a llamar al metodo de la clase GradientBack
        HeaderAppBar()
      ],
    );
  }
  
}