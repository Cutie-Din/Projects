import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_architecture/features/weather/presentation/bloc/weather_cubit.dart';
import 'package:weather_clean_architecture/features/weather/presentation/pages/weather_page.dart';
import 'package:weather_clean_architecture/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => sl<WeatherCubit>(),
        child: const WeatherPage(),
      ),
    );
  }
}
