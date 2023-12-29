import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'package:todo_app/screens/login/login_screen.dart';
import 'package:todo_app/screens/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  final SplashBloc splashBloc;

  const SplashScreen({Key? key, required this.splashBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    splashBloc.add(MoveToLoginScreen());
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
        }
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
    );
  }
}
