//Este archivo contendra toda la logica y todos los datos de la aplicacion con respecto a la conexion con FirebaseAuth
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//Nota: En la pagina de Firebase -> Desarrollo -> Authentucation habilitamos el proveedor de Google

class FirebaseAuthAPI {

  final FirebaseAuth _auth = FirebaseAuth.instance;//Esta variable contendra la instancia de FirebaseAuth
  final GoogleSignIn googleSignIn = GoogleSignIn();// Treamos la instancia de GoogleSignIn

  Future<FirebaseUser> signIn() async {//Para ejecutarse en una conexion en segundo plano necesitamos el async
      //Solicitamos el recuadro de google para solicitar con que cuenta nos queremos registrar
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();//await realiza el proceso de "parelelizar" y ejecutar un proceso en un segundo plano
      //Las credenciales las guardamos en gSA
      GoogleSignInAuthentication gSA = await googleSignInAccount.authentication; //Creamos la instacia de ese tipo y optenemos las credenciales

      //Realizamos una segunda autenticacion pero ahora con fireBase
      FirebaseUser user  = await _auth.signInWithCredential(
          GoogleAuthProvider.getCredential(//Utilizamos las credenciales de Google
              idToken: gSA.idToken,//
              accessToken: gSA.accessToken
          )
      );

      return user;//Retornamos el objeto
  }

}