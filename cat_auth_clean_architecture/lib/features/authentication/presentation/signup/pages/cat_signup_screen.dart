import 'package:cat_auth_clean_architecture/core/utils/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/constants/image_constants.dart';
import '../cubit/cat_signup_cubit.dart';

class CatSignUpScreen extends StatelessWidget {
  const CatSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for TextFormFields
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final usernameController = TextEditingController();

    return Scaffold(
      body: Center(
        child: BlocBuilder<CatSignUpCubit, CatSignUpState>(
          builder: (context, state) {
            if (state is CatSignUpLoading) {
              return Center(
                child: LottieBuilder.asset(AppImage.loading),
              );
            } else if (state is CatSignUpLoaded) {
              // Successfully loaded state
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add a success message or a new screen here
                  Text('Registered Successful'),
                ],
              );
            } else if (state is CatSignUpError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message), // Show error message
                ],
              );
            }

            // Default view: Register Form
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LottieBuilder.asset(AppImage.signup),
                    // Email TextFormField
                    SizedBox(height: 16.0),

                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.0),
                    // Username TextFormField
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 16.0),
                    // Password TextFormField
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 24.0),

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        // Trigger SignUp action here
                        context.read<CatSignUpCubit>().sendCatSignUp(
                            emailController.text, usernameController.text, passwordController.text);
                      },
                      child: Text('Sign Up'),
                    ),
                    SizedBox(height: 16.0),

                    // Back to SignIn Button
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Dùng Navigator để pop về trang SignIn
                      },
                      child: Text('Back'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
