import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

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
            children: [
              Text("Welcome \n This is your Travel App",
              style: TextStyle(
                fontSize: 37,
                fontFamily: "Lato",
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),)
            ],
          )
        ],
      ),
    );
  }

}