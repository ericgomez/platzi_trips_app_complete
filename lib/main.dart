import 'package:flutter/material.dart';
import 'description_place.dart';
import 'review_list.dart';//Importamos nuestra clase
import 'gradient_back.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //Declaracion de un String
  String descriptionDummy = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras accumsan, orci vel pulvinar finibus, risus dui pharetra quam, vitae consequat massa ligula sit amet sapien. Quisque pulvinar ultricies urna, id varius ligula mattis ut. In tincidunt vel sem at convallis. Proin eget purus facilisis, fermentum erat ac, tincidunt neque.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Cras accumsan, orci vel pulvinar finibus, risus dui pharetra quam, vitae consequat massa ligula sit amet sapien. Quisque pulvinar ultricies urna, id varius ligula mattis ut.";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        /*appBar: AppBar(
          title: Text("My Flutter App"),
        ),*/
        //body: new DescriptionPlace("Bahamas", 4, descriptionDummy),
        body: Stack(//un Stack permite colocar un elemento encima de otro
          children: [//En Stack tambien agregamos hijos
            ListView(//Enviamos nuestro contenido en forma de lista para que podamos utilizar el scroll
              children: [//Agrupamos los elementos
                DescriptionPlace("Bahamas", 4, descriptionDummy),
                ReviewList()
              ],
            ),
            GradientBack("Popular")//Mandamos a llamar al metodo de la clase GradientBack
          ],
        ),
        )
      );//MyHomePage(title: 'Flutter Demo Home Page'),
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
