import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class CloudFirestoreAPI {

  //Creamos dos constantes que contemdrans los nombres de mis colecciones que se almacenararn en Cloud Firestore
  final String USERS = "users";
  final String PLACES = "places";
  //Definimos nuestra entidad BD
  final Firestore _db =Firestore.instance;//Va a obtener toda la inicializacion o la conexion con la base de datos de la entidad de usuario

  final FirebaseAuth _auth = FirebaseAuth.instance;//Esta variable contendra la instancia de FirebaseAuth

  //Creamos el metodo
  void updateUserData(User user) async {
    //Comenzamos a definir nuestra data
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({//Se ejecuta en segundo plano con await
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()//Capturamos el ultimo login
    },
        merge: true //Indicamos que aplique los cambios en la base de datos
    );
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);//Generamos un identificados unico y auto incrementable
    //Consultamos el usuario que esta logeado
    await _auth.currentUser().then((FirebaseUser user) {
      refPlaces.add({
        //Optenemos los datos del formulario
        'name': place.name,
        'descripion': place.description,
        'like': place.likes,
        'userOwner': "${USERS}/${user.uid}"//Tipos de dato Reference
      });
    });

  }

}