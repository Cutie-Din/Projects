import 'package:flutter/material.dart';
import 'package:movie_clean_architecture/core/configs/theme/app_color.dart';
import 'package:reactive_button/reactive_button.dart';

Widget signInText() {
  return const Text(
    'Sign in',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  );
}

Widget emailField() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Email',
    ),
  );
}

Widget passwordField() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Password',
    ),
  );
}

Widget signinButton() {
  return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async {},
      onSuccess: () {},
      onFailure: (error) {});
}

Widget signupText() {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(text: "Don't you have account?"),
      ],
    ),
  );
}
