import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();//Creamos un objeto del tipo AuthRepository

  //Contendra los caso de uso de nuestra aplicacion
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn() {
      return _auth_repository.signInFirebase();
  }

  @override
  void dispose() {

  }
}