import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mme_notes_app/utils/colours.dart';
import 'package:mme_notes_app/services/auth_methods.dart';
import 'package:mme_notes_app/pages/sign_in_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  String lastname = '';
  String email = '';
  String photoUrl = '';
  bool admin = false;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
      lastname = (snap.data() as Map<String, dynamic>)['lastname'];
      email = (snap.data() as Map<String, dynamic>)['email'];
      photoUrl = (snap.data() as Map<String, dynamic>)['photoUrl'];
      admin = (snap.data() as Map<String, dynamic>)['admin'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: white,
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 50,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: offWhite,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 25,
                  color: blue,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "My Profile",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  CircleAvatar(
                    radius: 64.0,
                    backgroundImage: NetworkImage(photoUrl),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Name : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '$username $lastname',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: admin
                            ? const Center(
                                child: Text(
                                "(admin)",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.bold),
                              ))
                            : null,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Email : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: blue, elevation: 0.0),
                      onPressed: () async {
                        await AuthMethods().signOut();
                        if (context.mounted) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()));
                        }
                      },
                      child: const Text('Sign Out'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
