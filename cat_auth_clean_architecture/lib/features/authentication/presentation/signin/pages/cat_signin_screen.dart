import 'package:cat_auth_clean_architecture/core/utils/constants/api_constants.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/usecases/post_cat_auth.dart';
import 'package:cat_auth_clean_architecture/features/authentication/presentation/signin/cubit/cat_signin_cubit.dart';
import 'package:cat_auth_clean_architecture/features/authentication/presentation/signup/cubit/cat_signup_cubit.dart';
import 'package:cat_auth_clean_architecture/features/authentication/presentation/signup/pages/cat_signup_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/constants/image_constants.dart';
import '../../../../../injection.dart';
import '../../../data/data_sources/cat_auth_api_service.dart';
import '../../../data/repositories/cat_auth_repository_imp.dart';

class CatSignInScreen extends StatelessWidget {
  const CatSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for TextFormFields
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: BlocBuilder<CatSignInCubit, CatSigninState>(
          builder: (context, state) {
            if (state is CatSignInLoading) {
              return Center(
                child: LottieBuilder.asset(AppImage.loading),
              );
            } else if (state is CatSignInLoaded) {
              // Successfully loaded state
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add a success message or a new screen here
                  Text('Login Successful'),
                ],
              );
            } else if (state is CatSignInError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message), // Show error message
                ],
              );
            }

            // Default view: Login Form
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LottieBuilder.asset(AppImage.signin),
                    // Email TextFormField
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

                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        // Trigger login action here
                        context
                            .read<CatSignInCubit>()
                            .postCatSignIn(emailController.text, passwordController.text);
                      },
                      child: Text('Login'),
                    ),
                    SizedBox(height: 16.0),

                    // SignUp Button: Navigate to CatSignUpScreen
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return BlocProvider(
                                create: (context) => CatSignUpCubit(i<PostCatAuth>()),
                                child: CatSignUpScreen(),
                              );
                            },
                          ),
                        );
                      },
                      child: Text('Sign Up'),
                    )
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
