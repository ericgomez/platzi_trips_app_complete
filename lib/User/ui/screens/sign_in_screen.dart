import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';

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

  UserBloc userBloc;//Creamos el Objeto UserBloc

  @override
  Widget build(BuildContext context) {
    //Instanciamos el Objeto userBloc con BlocProvider
    userBloc = BlocProvider.of(context);

    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {//Este Widget maneja el esta de la sesion
    //En este metodo tendra la logica para decidir si ir a Widget signInGoogleUI o a otra pantalla
    return StreamBuilder(
      stream: userBloc.authStatus,
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot contiene nuestra data - nuestro objeto User traido desde FireBase
        if(!snapshot.hasData || snapshot.hasError){
          return signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );

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
                    userBloc.signOut();//Forzamos el cierre de sesion en caso de existir persistesia por Firebase
                    userBloc.signIn().then((FirebaseUser user) => print("El usuario es ${user.displayName}"));//Cuando alguien precione el boton de SignIn se llamara a este metodo
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