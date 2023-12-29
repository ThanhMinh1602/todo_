import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'package:todo_app/screens/bloc/splash/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(context),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          final splashBloc = BlocProvider.of<SplashBloc>(context);
          splashBloc.add(MoveToLoginScreen());
          return Scaffold(
            backgroundColor: AppColor.backgroundColor,
            body: Center(
              child: Image.asset(
                Assets.icons.todoLogo.path,
                width: 200,
              ),
            ),
          );
        },
      ),
    );
  }
}
