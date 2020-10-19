import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

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
    await _auth.currentUser().then((FirebaseUser user) {//Cuando el Place se añade
      refPlaces.add({
        //Optenemos los datos del formulario
        'name': place.name,
        'description': place.description,
        'like': place.likes,
        'urlImage': place.urlImage,
        'userOwner': _db.document("${USERS}/${user.uid}")//Esta es la forma como asignamos referencias
      }).then((DocumentReference dr) {
        dr.get().then((DocumentSnapshot snapshot) {//Obtengo la Photo de ese lugar
          //Asignar como referencia y un ARRAY
          DocumentReference refUsers = _db.collection(USERS).document(user.uid);//Esta es la forma como asignamos referencias
          refUsers.updateData({
            //Se estara realizando un push en el array y a signando una referencia
            'myPlaces': FieldValue.arrayUnion([_db.document("${PLACES}/${snapshot.documentID}")])//Nos permitira ase push al array y snapshot.documentID Me devuelve el ID del Place que se acaba de asignar
          });
        });
      });
    });

  }

  //Procesar los datos de Firebase
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {//recibiremos un tipos de dato placesListSnapshot
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();
    placesListSnapshot.forEach((p) {//Obtenemos los datos de cada lugar o Places

      profilePlaces.add(ProfilePlace(
        Place(//Puedo acceder a los datos que estan en FireBase con p.data
            name: p.data['name'],
            description: p.data['description'],
            urlImage: p.data['urlImage'],
            likes: p.data['likes']
        )

      ));

    });
    //Devolvemos la lista profilePlaces
    return profilePlaces;

  }

  //Metodo para obtener la lista de places hacemos el metodo Card_image_list lo mas generico posible
  List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageWithFabIcon> placesCard = List<CardImageWithFabIcon>();

    double width = 300;
    double height = 350;
    double left = 10;
    IconData iconData = Icons.favorite_border;

    placesListSnapshot.forEach((p) {
      placesCard.add(CardImageWithFabIcon(
          pathImage: p.data['urlImage'],
          width: width,
          height: height,
          left: left,
          onPressedFabIcon: () {
            //Contendra la accion al precional el boton
          },
          iconData: iconData
      ));
    });

    return placesCard;

  }


}