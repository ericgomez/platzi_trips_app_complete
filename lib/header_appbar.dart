import 'package:flutter/material.dart';
import 'gradient_back.dart';//importamos las clases que vamos a utilizar para hacer Stack
import 'card_image_list.dart';//importamos las clases que vamos a utilizar

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(//Stack me permite acomodar un Widget sobre otro Widget
      children: [
        GradientBack("Bienvenido"),
        CardImageList()
      ],
    );
  }

}