import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mme_notes_app/storage_methods.dart';
import 'package:mme_notes_app/user_model.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String lastname,
    required Uint8List file,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          lastname.isEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        String photoUrl =
            await StorageMethods().uploadImageToStorage('ProfilePics', file);

        model.User user = model.User(
          admin: false,
          uid: cred.user!.uid,
          email: email,
          username: username,
          lastname: lastname,
          photoUrl: photoUrl,
        );
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);
        res = 'Success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occurred';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
