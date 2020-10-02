import 'package:flutter/material.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}

class _PlatziTrips extends State<PlatziTrips> {
  @override
  Widget build(BuildContext context) {
    // En lugar de la clase Main utlizaremos esta clase como contenedor principal agregando el Scaffold
    return Scaffold(
      bottomNavigationBar: Theme(//Agregamos el bottomNavigationBar de una manera mas personalizada con Theme
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,//Color de fondo de nuestro bottomNavigationBar
          primaryColor: Colors.purple//Color de los iconos de bottomNavigationBar
        ),
          child: BottomNavigationBar(
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
                    icon: Icon(Icons.people),
                    title: Text("")
                ),
              ])),
    );
  }

}