import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/auth/bloc/auth_bloc.dart';
import 'package:todo_app/screens/auth/widgets/register_from.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocProvider(
          create: (context) => AuthBloc(context),
          child: const RegiterForm(),
        ),
      ),
    );
  }
}
