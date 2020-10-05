import 'package:flutter/material.dart';
import 'gradient_back_profile.dart';//importamos las clases que vamos a utilizar para hacer Stack
import 'card_image_list_profile.dart';//importamos las clases que vamos a utilizar
import 'data_profile.dart';

class HeaderAppBarProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(//Stack me permite acomodar un Widget sobre otro Widget
      children: [
        GradientBackProfile("Profile"),
        ListView(//Enviamos nuestro contenido en forma de lista para que podamos utilizar el scroll
          children: [//Agrupamos los elementos
            DataProfile("assets/img/ann.jpg", "Anahí Salgado", "team@platzi.com"),
          ],
        ),
        CardImageListProfile(),
      ],
    );
  }

}