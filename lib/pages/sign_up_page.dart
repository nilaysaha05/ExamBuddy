import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mme_notes_app/colours.dart';
import 'package:mme_notes_app/pages/auth_methods.dart';
import 'package:mme_notes_app/pages/home_page.dart';
import 'package:mme_notes_app/pages/sign_in_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mme_notes_app/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _lastnameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  Future signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      lastname: _lastnameController.text,
      file: _image!,
    );

    setState(() {
      _isLoading = false;
    });

    if (res == "success") {
      setState(() {
        _isLoading = false;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      });
      // navigate to the home screen
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(res, context);
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => const SignInPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: white,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64.0,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64.0,
                          backgroundImage: NetworkImage(
                              'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60.0,
              ),
              TextFormField(
                controller: _usernameController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: "first name", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _lastnameController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: "last name", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _emailController,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                  hintText: "email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _passwordController,
                maxLines: 1,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              InkWell(
                onTap: () async {
                  await signUpUser();
                },
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text(
                          'Sign Up',
                          style: TextStyle(color: white),
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blue,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      child: const Text(
                        " Sign in.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blue,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
