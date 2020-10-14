import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class CloudFirestoreAPI {

  //Creamos dos constantes que contemdrans los nombres de mis colecciones que se almacenararn en Cloud Firestore
  final String USERS = "users";
  final String PLACES = "places";
  //Definimos nuestra entidad BD
  final Firestore _db =Firestore.instance;//Va a obtener toda la inicializacion o la conexion con la base de datos de la entidad de usuario

  //Creamos el metodo
  void updateUserData(User user) async {
    //Comenzamos a definir nuestra data
    DocumentReference ref = _db.collection(USERS).document(user.uid);

  }

}