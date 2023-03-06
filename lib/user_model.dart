
class User {
      final String email;
      final String username;
      final String lastname;
      final String uid;
      final String photoUrl;
      final bool admin;
      final String graduationYear;
      const User({
        required this.email,
        required this.username,
        required this.lastname,
        required this.uid,
        required this.photoUrl,
        required this.admin,
        required this.graduationYear,
});

      Map<String, dynamic> toJson() => {
        "username": username,
        "lastname" :lastname,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "admin" : admin,
        'graduationYear' : graduationYear,
      };
}