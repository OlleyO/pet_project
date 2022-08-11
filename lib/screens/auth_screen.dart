import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_colors.dart';
import 'package:pet_project/constants/styles.dart';
import 'package:pet_project/screens/register_screen.dart';
import 'package:pet_project/widgets/space.dart';

enum AuthScreenType {
  login,
  signup,
}

abstract class AuthScreen extends StatefulWidget {
  AuthScreen({required this.onSubmit, required this.authType, Key? key})
      : super(key: key);

  final AuthScreenType authType;

  final VoidCallback onSubmit;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  Widget buildForWideScreen(
      BuildContext context, String authText, String helpingText) {
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    authText,
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Space.vertical(15.0),
                TextFormField(
                  cursorColor: AppColors.blue,
                  keyboardType: TextInputType.emailAddress,
                  style: kTextFieldStyle,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "oleh.selivanov@gmail.com",
                  ),
                ),
                Space.vertical(32.0),
                TextFormField(
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
                    child: Text(helpingText)),
                Space.vertical(32.0),
                ElevatedButton(
                  onPressed: () {
                    widget.onSubmit();
                  },
                  child: Text(authText),
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
        ),
      ],
    );
  }

  Widget buildForSmallScreen(
      BuildContext context, String authText, String helpingText) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    authText,
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Space.vertical(15.0),
                TextFormField(
                  cursorColor: AppColors.blue,
                  keyboardType: TextInputType.emailAddress,
                  style: kTextFieldStyle,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "oleh.selivanov@gmail.com",
                  ),
                ),
                Space.vertical(32.0),
                TextFormField(
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
                    child: Text(helpingText)),
                Space.vertical(32.0),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(authText),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String authText =
        widget.authType == AuthScreenType.signup ? "Sign Up" : "Log In";

    final String helpingText = widget.authType == AuthScreenType.signup
        ? "Already have an account? Log in"
        : "Don't have an account? Sign up";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth >= 1024) {
                return buildForWideScreen(context, authText, helpingText);
              } else {
                return buildForSmallScreen(context, authText, helpingText);
              }
            },
          ),
        ),
      ),
    );
  }
}
