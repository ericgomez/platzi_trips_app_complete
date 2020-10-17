import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {
  //Creamos nuetras instancias
  final StorageReference _storageReference = FirebaseStorage.instance.ref();//Obtiene la URL de la Photo

  //Este metodo va a enfocarse a la subida del archivo
  Future<StorageUploadTask> uploadFile(String path, File image) async {

      return _storageReference.child(path).putFile(image);
  }
}