import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_project/screens/auth_screen.dart';

class RegisterScreen extends AuthScreen {
  static const path = "register";

  final VoidCallback onSubmit;

  RegisterScreen({
    required this.onSubmit,
  }) : super(
          onSubmit: onSubmit,
          authType: AuthScreenType.signup,
        );
}
