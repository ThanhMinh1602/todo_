import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/components/button/td_elevated_button.dart';
import 'package:todo_app/components/text_field/td_text_field.dart';
import 'package:todo_app/components/text_field/td_text_field_password.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'package:todo_app/screens/login/login/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: BlocProvider(
        create: (context) => AuthBloc(context), // Khởi tạo AuthBloc
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final authBloc = BlocProvider.of<AuthBloc>(context);
            return LoginForm(
              height: MediaQuery.of(context).size.height,
              emailController: _emailController,
              passwordController: _passwordController,
              authBloc: authBloc,
            );
          },
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.height,
    required this.emailController,
    required this.passwordController,
    required this.authBloc,
  }) : super(key: key);

  final double height;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0)
            .copyWith(top: MediaQuery.of(context).padding.top + height * 0.15),
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
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_app/screens/bloc/login/auth_bloc.dart';
// import 'package:todo_app/screens/login/widgets/login_form.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
//     final _emailController = TextEditingController();
//     final _passwordController = TextEditingController();

//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: BlocProvider.value(
//         value: authBloc,
//         child: LoginForm(
//           emailController: _emailController,
//           passwordController: _passwordController,
//         ),
//       ),
//     );
//   }
// }
