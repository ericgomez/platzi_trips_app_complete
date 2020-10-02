import 'package:flutter/material.dart';
import 'home_trips.dart';
import 'search_trips.dart';
import 'map_trips.dart';
import 'notification_trips.dart';
import 'profile_trips.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // Retornamos el metodo _PlatziTrips que contiene el State que es el metodo que espera este StatefulWidget
    return _PlatziTrips();
  }

}

class _PlatziTrips extends State<PlatziTrips> {

  //Creamos un indice para acceder a cada elemento de la lista
  //los indices siempre inician de 0 a n-1
  int indexTap = 0;

  //Lista de elementos
  final List<Widget> widgetsChildren  = [//Guardamos los elementos en un arreglo
    HomeTrips(),//Mandamos llamar al metodo de la clase home_trips
    SearchTrips(),
    MapTrips(),
    NotificationTrips(),
    ProfileTrips()
  ];

  //Contruimos el metodo para la navegacio de nuestros botones
  void onTapTapped (int index){//Este metodo recive el indice del Tap
    setState(() {//con setState llamamos toda la funcionalidad de nuestro StatefulWidget
      //Controlamos el estado del Widget
      indexTap = index;//Le decimos que el idice que reciba la asigne a indexTap
    });
  }

  @override
  Widget build(BuildContext context) {

    // En lugar de la clase Main utlizaremos esta clase como contenedor principal agregando el Scaffold
    return Scaffold(
      body: widgetsChildren[indexTap],//Llamamos nuestros Widget para que se incialize simpre en la posicion 0 con la variable indexTap
      bottomNavigationBar: Theme(//Agregamos el bottomNavigationBar de una manera mas personalizada con Theme
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,//Color de fondo de nuestro bottomNavigationBar
          primaryColor: Colors.purple//Color de los iconos de bottomNavigationBar
        ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, //Este metodo permite mostrar el diseño mas de tres iconos cambiando  el tipo de la barra de navegación a fixed
            onTap: onTapTapped,//onTap metodo que indica que va a suceder cuando den click sobre el en este caso ejecuta el metodo onTapTapped
            currentIndex: indexTap,//Le indicamos el indice inicial para que nos permita swhitchear entre botones
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text("")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    title: Text("")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.place),
                    title: Text("")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    title: Text("")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text("")
                ),
              ])),
    );
  }

}