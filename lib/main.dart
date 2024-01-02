import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/splash/bloc/splash_bloc.dart';
import 'package:todo_app/screens/splash/splash_screen.dart';
import 'package:todo_app/service/local/shared_prefs.dart';

void main() {
  SharedPrefs.initialise();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SplashBloc splashBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(
          splashBloc: splashBloc,
        ),
      ),
    );
  }
}
