import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mme_notes_app/storage_methods.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String>signUpUser({
    required String email,
    required String password,
    required String username,
    required String lastname,
    required Uint8List file,
  }) async{
    String res = 'Some error occurred';
    try{
      if(email.isNotEmpty||password.isNotEmpty||username.isNotEmpty||lastname.isEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        String photoUrl = await StorageMethods().uploadImageToStorage('ProfilePics', file);
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username' : username,
          'lastname' : lastname,
          'uid' : cred.user!.uid,
          'email' : email,
          'admin' : false,
          'photoUrl' : photoUrl==''?'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg':photoUrl,
        });
        res ='Success';
      }
    }
    catch(err){
      res=err.toString();
    }
    return res;

  }
  Future<String>logInUser({
    required String email,
    required String password,
  })
  async
  {
    String res = 'Some error occurred';

    try{
      if(email.isNotEmpty||password.isNotEmpty)
      {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res ='success';
      }
      else{
        res = 'please enter all the fields';
      }

    } catch(err){
      res =err.toString();
    }
    return res;
  }

}