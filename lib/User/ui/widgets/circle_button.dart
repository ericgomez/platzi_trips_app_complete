import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final VoidCallback onPressed;
  bool mini;
  var icon;
  double iconSize;
  var color;

  CircleButton(this.mini, this.icon, this.iconSize, this.color, @required this.onPressed);

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }

}

class _CircleButton extends State<CircleButton> {

  void onPressedButton() {

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
          backgroundColor: widget.color,
          mini: widget.mini,
          onPressed: widget.onPressed,//Metodo que recibe la funcion que generamos en la parte superior
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: Color(0xFF4268D3),
          ),
          heroTag: null,//Cuando tenemos muchos FloatingActionButton los Tags se comienzan a duplicar lo recomendable es ponerlo como nulo
        )
    );
  }
}