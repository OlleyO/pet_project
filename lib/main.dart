import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_project/firebase_options.dart';
import 'package:pet_project/screens/home_screen.dart';
import 'package:pet_project/screens/login_screen.dart';
import 'package:pet_project/screens/profie_edit_screen.dart';
import 'package:pet_project/screens/profile_screen.dart';
import 'package:pet_project/screens/register_screen.dart';

void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Linkstagram',
      theme: ThemeData(
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 16.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.05,
          ),
        ),
      ),
      routes: {
        HomeScreen.path: (context) => HomeScreen(),
        LoginScreen.path: (context) => LoginScreen(),
        ProfileEditScreen.path: (context) => ProfileEditScreen(),
        ProfileScreen.path: (context) => ProfileScreen(),
        RegisterScreen.path: (context) => RegisterScreen(),
      },
      initialRoute: ProfileScreen.path,
    );
  }
}
