import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean_architecture/core/config/theme/app_colors.dart';
import '../../../../common/cubit/post_data_cubit.dart';
import '../../../../services_locator.dart';
import '../widgets/sign_In_widgets.dart'; // Your widget file

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocProvider(
      create: (_) => sl<PostCubit>(),
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.only(top: 100, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              signInText(),
              const SizedBox(height: 30),
              signInEmailField(emailController),
              const SizedBox(height: 20),
              signInPasswordField(passwordController),
              const SizedBox(height: 60),
              BlocBuilder<PostCubit, PostDataState>(
                builder: (context, state) {
                  if (state is PostDataLoading) {
                    return const CircularProgressIndicator(); // Show loading spinner while signing In
                  } else if (state is PostDataError) {
                    // Show error message using a SnackBar
                    Future.delayed(Duration.zero, () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: AppColors.background,
                            content: Text(
                              state.errorMessage,
                              style: TextStyle(color: AppColors.lightBackground),
                            )),
                      );
                    });
                  } else if (state is PostDataSuccess) {
                    // Show success message
                    Future.delayed(Duration.zero, () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: AppColors.background,
                            content: Text(
                              'Login Succeed!',
                              style: TextStyle(color: AppColors.lightBackground),
                            )),
                      );
                    });
                  }

                  return signInButton(() {
                    final email = emailController.text;
                    final password = passwordController.text;
                    context.read<PostCubit>().signIn(email, password);
                  });
                },
              ),
              const SizedBox(height: 20),
              signUpText(context),
            ],
          ),
        ),
      ),
    );
  }
}
