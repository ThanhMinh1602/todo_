import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'package:todo_app/screens/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(context),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          final splashBloc = BlocProvider.of<SplashBloc>(context);
          splashBloc.add(MoveToLoginScreen());
        },
        child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: Center(
            child: Image.asset(
              Assets.icons.todoLogo.path,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
