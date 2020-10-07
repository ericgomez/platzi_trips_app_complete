import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';

//Nota: La Clase StatefulWidget necesita de una clase State
class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //Retornamos de la clase _SignInScreen que hereda de State
    return _SignInScreen();
  }

}

//Clase anidada
class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUI();
  }

  //Si el usuario no esta logeado
  Widget signInGoogleUI() {
    return Scaffold(
      //Elemento tipo Stack es cuando un elemento esta sobre otro elemento
      body: Stack(
        alignment: Alignment.center,//Se realiza un alineado al centro
          //ponemos los que esta mas atras
        children: [
          GradientBack("", null),//Si coloco a null me lo pondra fullScreen
          Column(
            mainAxisAlignment: MainAxisAlignment.center,//Utilizamos la propiedad MainAxisAlignment para Centrar los elementos de manera vertical
            children: [
              Text("Welcome \n This is your Travel app.",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(text: "Login with Gmail",//De esta manera enviamos los elementos al constructor de la clase button_green.dart
                  onPressed: () {

                  },
                width: 300,
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }

}