import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean_architecture/common/cubit/post_data_cubit.dart';
import 'package:movie_clean_architecture/core/config/theme/app_theme.dart';
import 'package:movie_clean_architecture/presentation/cubit/splash/splash_cubit.dart';
import 'package:movie_clean_architecture/presentation/pages/auth/screens/sign_up_screen.dart';
import 'package:movie_clean_architecture/presentation/pages/splash/splash.dart';
import 'package:movie_clean_architecture/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return BlocProvider(
      create: (_) => sl<SplashCubit>()..appStarted(),
      // create: (_) => sl<PostCubit>(),
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: AppTheme.appLight,
        darkTheme: AppTheme.appDark,
        home: const SplashScreen(),
      ),
    );
  }
}
