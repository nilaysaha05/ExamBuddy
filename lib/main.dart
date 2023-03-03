import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mme_notes_app/pages/home_page.dart';
import 'package:mme_notes_app/pages/sign_in_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.active)
          {
            if(snapshot.hasData)
            {
              return const HomePage();
            }
            else if (snapshot.hasError)
            {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }

          }
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SignInPage();
        },
      ),
    );
  }
}
