import 'package:flutter/material.dart';
import 'package:movie_clean_architecture/presentation/pages/auth/widgets/sign_in_widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          signInText(),
          const SizedBox(
            height: 30,
          ),
          emailField(),
          const SizedBox(
            height: 20,
          ),
          passwordField(),
          const SizedBox(
            height: 20,
          ),
          signinButton(),
        ],
      ),
    ));
  }
}
