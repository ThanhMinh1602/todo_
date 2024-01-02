import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/service/remote/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BuildContext context;
  AuthServices authService = AuthServices();
  AuthBloc(this.context) : super(LoginInitial()) {
    on<LoginPressed>(loginPressed);
    on<SendOtpPressed>(sendOtp);
    on<RegisterPressed>(register);
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

  Future<void> sendOtp(event, emit) async {
    if (event is SendOtpPressed) {
      final email = event.email;
      authService.sendOTP(email).then((response) {
        final data = jsonDecode(response.body);
        if (data['status_code'] == 200) {
          print('object code ${data['body']['code']}');
        } else {
          print('object code ${data['message']}');
        }
      });
    }
    emit(OtpSuccess());
  }

  Future<void> register(event, emit) async {
    if (event is RegisterPressed) {
      final name = event.name;
      final email = event.email;
      final password = event.password;
      final age = event.age;
      final code = event.code;
      final response = await authService.register(name, email, password, age, code);
        final data = jsonDecode(response.body);
        if (data['status_code'] == 200) {
          print('object code ${data['body']['code']}');
        } else {
          print('object code ${data['message']}');
        }
    }
    emit(RegisterSuccess());
  }
  Future<void> login() async {
    emit(LoginSuccess());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }
}
