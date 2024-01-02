import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/components/button/td_elevated_button.dart';
import 'package:todo_app/components/text_field/td_text_field.dart';
import 'package:todo_app/components/text_field/td_text_field_password.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'package:todo_app/screens/auth/bloc/auth_bloc.dart';
import 'package:todo_app/utils/validator.dart';

class RegiterForm extends StatelessWidget {
  const RegiterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController codeController = TextEditingController();
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0).copyWith(
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            children: [
              Text(
                'Register'.toUpperCase(),
                style: const TextStyle(fontSize: 25.0),
              ),
              Image.asset(
                Assets.images.loginImage.path,
                width: 160,
              ),
              const SizedBox(height: 50.0),
              TdTextField(
                validator: Validator.requiredValidator,
                controller: nameController,
                hintText: 'Name',
              ),
              const SizedBox(height: 20.0),
              TdTextField(
                  validator: Validator.requiredValidator,
                  controller: ageController,
                  hintText: 'Age',
                  keyboardType: TextInputType.number),
              const SizedBox(height: 20.0),
              TdTextField(
                validator: Validator.emailValidator,
                controller: emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20.0),
              TdTextFieldPassword(
                validator: Validator.passwordValidator,
                controller: passwordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TdTextField(
                      validator: Validator.requiredValidator,
                      controller: codeController,
                      hintText: 'OTP',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  TextButton(
                      onPressed: () {
                        authBloc.add(
                            SendOtpPressed(email: emailController.text.trim()));
                      },
                      child: Text('Send OTP',
                          style: TextStyle(color: AppColor.primaryColor)))
                ],
              ),
              const SizedBox(height: 30.0),
              TdElevatedButton(
                text: 'Register'.toUpperCase(),
                color: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
                onPressed: () {
                  if (formKey.currentState!.validate() == false) {
                    return;
                  }
                  authBloc.add(RegisterPressed(
                      name: nameController.text,
                      email: emailController.text.trim(),
                      password: passwordController.text,
                      age: int.parse(ageController.text),
                      code: codeController.text));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
