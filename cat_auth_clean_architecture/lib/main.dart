import 'package:cat_auth_clean_architecture/features/authentication/presentation/signin/cubit/cat_signin_cubit.dart';
import 'package:cat_auth_clean_architecture/features/authentication/presentation/signin/pages/cat_signin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'features/authentication/presentation/signup/cubit/cat_signup_cubit.dart';
import 'features/authentication/presentation/signup/pages/cat_signup_screen.dart';
import 'injection.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

// Future<void> main() async {
//   await initializeDependencies();
//   runApp(
//     const MyApp(),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => i<CatSignInCubit>(),
          ),
          BlocProvider(
            create: (_) => i<CatSignUpCubit>(),
          ),
        ],
        child: CatSignInScreen(), // Giao diện nhận các bloc
      ),
    );
  }
}
