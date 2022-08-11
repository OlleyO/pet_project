import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_project/screens/auth_screen.dart';

class LoginScreen extends AuthScreen {
  static const path = "login";

  final VoidCallback onSubmit;

  LoginScreen({
    required this.onSubmit,
  }) : super(
          onSubmit: onSubmit,
          authType: AuthScreenType.login,
        );
}
