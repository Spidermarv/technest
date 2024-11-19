import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technest/blocks/spash_cubit.dart';
import 'blocks/splash.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplahCubit()..appStarted(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tech Nest',
        home: SplashPage(),
      ),
    );
  }
}
