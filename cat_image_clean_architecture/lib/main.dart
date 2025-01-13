import 'package:cat_image_clean_architecture/injection.dart';
import 'package:cat_image_clean_architecture/presentation/cubit/cat_image_cubit.dart';
import 'package:cat_image_clean_architecture/presentation/page/cat_image_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
    // const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: BlocProvider(
        create: (_) => sl<CatImageCubit>(),
        child: CatImageScreen(),
      ),
    );
  }
}
