import 'package:flutter/material.dart';
import 'review.dart';//Importamos la clase Review

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,//Alineamos al inicio que es como si se alineara a la izquierda
      children: [
        //Creamos un objeto de la clase Review y le enviamos valores
        Review("assets/img/people.jpg", "Varuna Yasas", "1 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Review("assets/img/ann.jpg", "Anahí Salgado", "2 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Review("assets/img/girl.jpg", "Gissele Thomas", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),
      ],
    );
  }

}