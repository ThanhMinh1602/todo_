import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home_screen.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BuildContext context;
  AuthBloc(this.context) : super(LoginInitial()) {
    on<AuthEvent>(loginPressed);
  }

  Future<void> loginPressed(event, emit) async {
    if (event is LoginPressed) {
      final email = event.email;
      final password = event.password;
      if (email == 'ntminh16201@gmail.com' && password == '123456') {
        emit(LoginSuccess());
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      } else {
        emit(
          const LoginFailure(error: 'Đăng nhập thất bại'),
        );
      }
    } else if (event is LogoutRequested) {
      emit(LoggedOut());
    }
  }
}
