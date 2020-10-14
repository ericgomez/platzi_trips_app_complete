import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();//Creamos un objeto del tipo AuthRepository

  //Declaramos el Flujo de datos - Streams
  //Flujo de datos alterno Streams - Firebase
  //ScreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;//Nos devuelve el estado de la sesion

  //Contendra los caso de uso de nuestra aplicacion
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn() {
      return _auth_repository.signInFirebase();
  }

  @override
  void dispose() {

  }
}