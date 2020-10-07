import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platzi_trips_app/Place/ui/screens/home_trips.dart';
import 'package:platzi_trips_app/Place/ui/screens/search_trips.dart';
import 'package:platzi_trips_app/Place/ui/screens/map_trips.dart';
import 'package:platzi_trips_app/Place/ui/screens/notification_trips.dart';
import 'package:platzi_trips_app/User/ui/screens/profile_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: Colors.white.withAlpha(50),//Color desvanecido en CupertinoTabScaffold
            items: [
              /*BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.indigo), //Ejemplo con color definido
                  title: Text("")
              ),*/
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
            ]
        ),

        // ignore: missing_return
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
              break;
            // ignore: missing_return
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => MapTrips(),
              );
              break;
            case 3:
              return CupertinoTabView(
                builder: (BuildContext context) => NotificationTrips(),
              );
              break;
            case 4:
              return CupertinoTabView(
                builder: (BuildContext context) => ProfileTrips(),
              );
              break;

          }

        },
      ),
    );
  }

}