import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final star = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),

      child: Icon(
        Icons.star,
        color: Color(0xFFF2C611),
      ),
    );

    final title_stars = Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0,
          ),

          child: Text(
            "Duwili Ella",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,

          ),
        ),

        Row(
          children: [
            star,
            star,
            star,
            star,
            star
          ],
        )
      ],
    );

    final description = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          right: 20.0,
          left: 20.0
      ),

      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tempor massa augue, sit amet tristique erat aliquam nec. Fusce dui lectus, ullamcorper quis euismod id, convallis non dui.",
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        color: Color(0xFF56575a)
      ),
      ),
    );

    return Column(
      children: [
        title_stars,
        description
      ],
    );
  }
  
}