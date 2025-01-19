import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_clean_architecture/core/config/assets/app_images.dart';
import 'package:movie_clean_architecture/presentation/cubit/splash/splash_cubit.dart';
import 'package:movie_clean_architecture/presentation/pages/auth/screens/sign_in_screen.dart';
import 'package:movie_clean_architecture/presentation/pages/home/home_screen.dart';

import '../../../common/helper/navigation/app_nav.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNav.pushReplacement(context, const SignInScreen());
        }
        if (state is Authenticated) {
          AppNav.pushReplacement(context, const HomeScreen());
        }
      },
      child: Center(
        child: SvgPicture.asset(AppImages.splash),
      ),
    ));
  }
}
