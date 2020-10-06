import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'platzi_trips_cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';

void main() {
  //SystemChrome vuelve la barra de estado transparente en Android para que no tenga un color diferente
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light
      )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(//Aquien se lo quiero exponer en este caso al widget mas alto MaterialApp
            title: 'Flutter App',
            theme: ThemeData(
              primarySwatch: Colors.purple,//Color primario de la aplicacion
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            //home: PlatziTrips()//Mandamos llamar el metodo de la clase platzi_trips que contiene el bottomNavigationBar estilo Clasico para Android
            home: PlatziTripsCupertino()//Mandamos llamar el metodo de la clase platzi_trips que contiene el bottomNavigationBar Cupertino iOS para Mac
        ),
        bloc: UserBloc());//Lo que quiero exporner
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
