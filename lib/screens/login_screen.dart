import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_project/constants/app_colors.dart';
import 'package:pet_project/constants/styles.dart';
import 'package:pet_project/screens/register_screen.dart';
import 'package:pet_project/widgets/space.dart';

class LoginScreen extends StatefulWidget {
  static const String path = "login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  "Log In",
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Space.vertical(15.0),
              TextField(
                cursorColor: AppColors.blue,
                keyboardType: TextInputType.emailAddress,
                style: kTextFieldStyle,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "oleh.selivanov@gmail.com",
                ),
              ),
              Space.vertical(32.0),
              TextField(
                obscureText: true,
                style: kTextFieldStyle,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "qwerty123",
                ),
              ),
              Space.vertical(15.0),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.path);
                  },
                  child: Text("Don't have an account? Create one")),
              Space.vertical(32.0),
              ElevatedButton(
                onPressed: () {},
                child: Text("Log In"),
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
                  "Log In",
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Space.vertical(15.0),
              TextField(
                cursorColor: AppColors.blue,
                keyboardType: TextInputType.emailAddress,
                style: kTextFieldStyle,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "oleh.selivanov@gmail.com",
                ),
              ),
              Space.vertical(32.0),
              TextField(
                obscureText: true,
                style: kTextFieldStyle,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "qwerty123",
                ),
              ),
              Space.vertical(15.0),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.path);
                  },
                  child: Text("Don't have an account? Create one")),
              Space.vertical(32.0),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Log In"),
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
