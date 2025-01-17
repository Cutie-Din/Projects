import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_clean_architecture/core/configs/assets/app_images.dart';
import 'package:movie_clean_architecture/presentation/cubit/splash/splash_cubit.dart';
import 'package:movie_clean_architecture/presentation/pages/auth/sign_in.dart';
import 'package:movie_clean_architecture/presentation/pages/home/home.dart';

import '../../../common/helper/app_nav.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNav.pushReplacement(context, SignInScreen());
        }
        if (state is Authenticated) {
          AppNav.pushReplacement(context, HomeScreen());
        }
      },
      child: Scaffold(
        body: Center(
          child: SvgPicture.asset(AppImages.splash),
        ),
      ),
    );
  }
}
