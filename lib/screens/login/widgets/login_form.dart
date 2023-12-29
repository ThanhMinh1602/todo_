import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/components/button/td_elevated_button.dart';
import 'package:todo_app/components/text_field/td_text_field.dart';
import 'package:todo_app/components/text_field/td_text_field_password.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'package:todo_app/screens/login/bloc/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0)
            .copyWith(top: MediaQuery.of(context).size.height * 0.2),
        child: Column(
          children: [
            Image.asset(
              Assets.images.loginImage.path,
              width: 160,
            ),
            const SizedBox(height: 50.0),
            _buildEmailField(_emailController),
            const SizedBox(height: 20.0),
            _buildPasswordField(_passwordController),
            const SizedBox(height: 30.0),
            _buildLoginButton(authBloc, _emailController, _passwordController),
            const SizedBox(height: 20.0),
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

Widget _buildEmailField(TextEditingController controller) {
  return TdTextField(
    controller: controller,
    hintText: 'Email',
  );
}

Widget _buildPasswordField(TextEditingController controller) {
  return TdTextFieldPassword(
    controller: controller,
    hintText: 'Password',
  );
}

Widget _buildLoginButton(
  AuthBloc authBloc,
  TextEditingController emailController,
  TextEditingController passwordController,
) {
  return TdElevatedButton(
    text: 'Login'.toUpperCase(),
    color: AppColor.primaryColor,
    borderColor: AppColor.primaryColor,
    onPressed: () {
      authBloc.add(LoginPressed(
        email: emailController.text,
        password: passwordController.text,
      ));
    },
  );
}
