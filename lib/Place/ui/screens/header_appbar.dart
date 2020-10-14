import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';//importamos las clases que vamos a utilizar para hacer Stack
import 'package:platzi_trips_app/Place/ui/widgets/card_image_list.dart';//importamos las clases que vamos a utilizar

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(//Stack me permite acomodar un Widget sobre otro Widget
      children: [
        GradientBack(height: 250),
        CardImageList()
      ],
    );
  }

}