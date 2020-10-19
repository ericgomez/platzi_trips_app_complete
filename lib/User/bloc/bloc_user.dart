import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();//Creamos un objeto del tipo AuthRepository

  //Declaramos el Flujo de datos - Streams
  //Flujo de datos alterno Streams - Firebase
  //ScreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;//Nos devuelve el estado de la sesion

  //Creamos un metodo que sea un futuro
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Contendra los caso de uso de nuestra aplicacion
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn() => _auth_repository.signInFirebase();

  //2. SignOut (Cierre de Sesion) a la aplicación Google
  signOut() {
    _auth_repository.signOut();
  }

  //3. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();//Creamos la entidad para llamar al metodo correpondiente
  //Creamos el metodo
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);

  /*Stream Estara escuchando cuando nuestra data cambie
  * para que la ventana de lugares siempre este escuchando y se refresque automaticamente cuando alguien agrege un nuevo lugar*/
  Stream<QuerySnapshot> placesListStream = Firestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();//Se solicita la fotografia que este en la base de datos Firestore en la coleccion Places
  Stream<QuerySnapshot> get placesStream => placesListStream;//Estaremos escuchando el objeto placesStream
  //List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot);
  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, User user) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot, user);
  Future likePlace(Place place, String uid) => _cloudFirestoreRepository.likePlace(place,uid);


  Stream<QuerySnapshot> myPlacesListStream(String uid) => Firestore.instance.collection(CloudFirestoreAPI().PLACES)//Comenzamos con nuestro filtro
      .where("userOwner", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().USERS}/${uid}"))//Este metodo me conveirte la cadana automaticamente a un Strings
      .snapshots();

  //Mapeamos el metodo
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);

  StreamController<Place> placeSelectedStreamController =  StreamController<Place>();
  Stream<Place> get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink<Place> get placeSelectedSink =>  placeSelectedStreamController.sink;

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  @override
  void dispose() {

  }
}