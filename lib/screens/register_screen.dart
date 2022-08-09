import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_colors.dart';
import 'package:pet_project/constants/styles.dart';
import 'package:pet_project/screens/home_screen.dart';
import 'package:pet_project/screens/login_screen.dart';
import 'package:pet_project/widgets/space.dart';

class RegisterScreen extends StatefulWidget {
  static const String path = "register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String email = "";
  String password = "";

  Future<void> register() async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (userCredential != null) {
      await _firestore.collection("users").add(<String, dynamic>{
        "avatar_url": "",
        "email": userCredential.user?.email,
        "followers": 0,
        "following": 0,
        "name": "",
        "surname": "",
      });
      Navigator.pushNamed(context, HomeScreen.path);
    }
  }

  Widget buildForWideScreen(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            "assets/images/auth.png",
            fit: BoxFit.contain,
          ),
        ),
        Space.horizontal(20.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Space.vertical(15.0),
              TextField(
                onChanged: (value) => email = value,
                cursorColor: AppColors.blue,
                keyboardType: TextInputType.emailAddress,
                style: kTextFieldStyle,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "oleh.selivanov@gmail.com",
                ),
              ),
              Space.vertical(32.0),
              TextField(
                onChanged: (value) => password = value,
                obscureText: true,
                style: kTextFieldStyle,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "qwerty123",
                ),
              ),
              Space.vertical(15.0),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.path);
                  },
                  child: Text("Already have an account? Sign in")),
              Space.vertical(32.0),
              ElevatedButton(
                onPressed: () {
                  register();
                },
                child: Text("Sign Up"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.all(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildForSmallScreen(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Space.vertical(15.0),
              TextField(
                onChanged: (value) => email = value,
                cursorColor: AppColors.blue,
                keyboardType: TextInputType.emailAddress,
                style: kTextFieldStyle,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "oleh.selivanov@gmail.com",
                ),
              ),
              Space.vertical(32.0),
              TextField(
                onChanged: (value) => password = value,
                obscureText: true,
                style: kTextFieldStyle,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "qwerty123",
                ),
              ),
              Space.vertical(15.0),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.path);
                  },
                  child: Text("Already have an account? Sign in")),
              Space.vertical(32.0),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  register();
                },
                child: Text("Sign Up"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.all(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0).copyWith(
            bottom: 16.0,
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth >= 1024) {
                return buildForWideScreen(context);
              } else {
                return buildForSmallScreen(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
