import 'package:cat_facts_clean_architecture/features/cat_facts/presentation/pages/cat_facts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/cat_facts/presentation/cubit/cat_facts_cubit.dart';
import 'injection.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => sl<CatFactsCubit>(),
        child: CatFactsPage(),
      ),
    );
  }
}
