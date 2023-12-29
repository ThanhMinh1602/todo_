import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/components/button/td_elevated_button.dart';
import 'package:todo_app/components/text_field/td_text_field.dart';
import 'package:todo_app/components/text_field/td_text_field_password.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'package:todo_app/screens/login/login/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: MediaQuery.of(context).padding.top + height * 0.15,
        ),
        child: Column(
          children: [
            Image.asset(
              Assets.images.loginImage.path,
              width: 160,
            ),
            const SizedBox(height: 50.0),
            TdTextField(
              controller: emailController,
              hintText: 'Email',
            ),
            const SizedBox(height: 20.0),
            TdTextFieldPassword(
              controller: passwordController,
              hintText: 'Password',
            ),
            const SizedBox(height: 30.0),
            TdElevatedButton(
              text: 'Login'.toUpperCase(),
              color: AppColor.primaryColor,
              borderColor: AppColor.primaryColor,
              onPressed: () {
                authBloc.add(LoginPressed(
                  email: emailController.text,
                  password: passwordController.text,
                ));
              },
            ),
            const SizedBox(height: 20.0),
            TdElevatedButton.outline(
              text: 'Register'.toUpperCase(),
              borderColor: AppColor.primaryColor,
              textColor: AppColor.primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
