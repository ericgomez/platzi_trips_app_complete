import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/repository/firebase_auth_api.dart';

class AuthRepository {

  final _firebaseAuthAPI = FirebaseAuthAPI();//Creamos el objeto de la clase FierebaseAuth

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();

  //Difinimos el metodo con la fuente de datos podemos omitir el "void"
  signOut() => _firebaseAuthAPI.signOut();//Fuente de datos para el cierre de sesion en Firebase

}