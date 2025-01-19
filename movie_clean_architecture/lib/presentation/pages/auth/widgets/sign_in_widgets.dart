import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_clean_architecture/common/helper/navigation/app_nav.dart';
import 'package:movie_clean_architecture/core/config/theme/app_colors.dart';

import '../screens/sign_up_screen.dart';

signInText() {
  return const Text(
    'Sign In',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  );
}

signInEmailField(TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: 'Email',
    ),
  );
}

signInPasswordField(TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: true,
    decoration: InputDecoration(
      hintText: 'Password',
    ),
  );
}

signInButton(VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
    ),
    onPressed: onPressed,
    child: const Text(
      'Sign In',
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}

signUpText(BuildContext context) {
  return Text.rich(
    TextSpan(children: [
      TextSpan(text: "Don't you have an account? "),
      TextSpan(
          text: "Sign Up",
          style: TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNav.push(context, const SignUpScreen());
            }),
    ]),
  );
}
