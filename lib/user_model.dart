import 'package:cloud_firestore/cloud_firestore.dart';

class User {
      final String email;
      final String username;
      final String lastname;
      final String uid;
      final String photoUrl;
      final bool admin;
      const User({
        required this.email,
        required this.username,
        required this.lastname,
        required this.uid,
        required this.photoUrl,
        required this.admin,
});

      Map<String, dynamic> toJson() => {
        "username": username,
        "lastname" :lastname,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "admin" : admin,
      };
}