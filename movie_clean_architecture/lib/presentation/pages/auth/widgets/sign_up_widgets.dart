import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_clean_architecture/common/helper/navigation/app_nav.dart';
import 'package:movie_clean_architecture/core/config/theme/app_colors.dart';
import 'package:movie_clean_architecture/presentation/pages/auth/screens/sign_in_screen.dart';

signUpText() {
  return const Text(
    'Sign Up',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  );
}

signUpEmailField(TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: 'Email',
    ),
  );
}

signUpPasswordField(TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: true,
    decoration: InputDecoration(
      hintText: 'Password',
    ),
  );
}

signUpButton(VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
    ),
    onPressed: onPressed,
    child: const Text(
      'Sign Up',
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}

signInText(BuildContext context) {
  return Text.rich(
    TextSpan(children: [
      TextSpan(text: "Do you have an account? "),
      TextSpan(
          text: "Sign in",
          style: TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNav.push(context, const SignInScreen());
            }),
    ]),
  );
}
