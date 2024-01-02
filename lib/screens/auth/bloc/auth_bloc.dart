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
      try {
        final email = event.email;
        final password = event.password;
        final response = await authService.login(email, password);
        final data = jsonDecode(response.body);
        if (data['status_code'] == 200) {
          print('object code ${data['body']['code']}');
        } else {
          print('object code ${data['message']}');
        }
      } catch (e) {
        print('Login failed with error: $e');
      }
    }
    emit(LoginSuccess());
  }

  Future<void> sendOtp(event, emit) async {
    if (event is SendOtpPressed) {
      try {
        final email = event.email;
        final response = await authService.sendOTP(email);
        final data = jsonDecode(response.body);
        if (data['status_code'] == 200) {
          print('object code ${data['body']['code']}');
        } else {
          print('object code ${data['message']}');
        }
      } catch (e) {
        print('OtpOtp failed with error: $e');
      }
    }
    emit(OtpSuccess());
  }

  Future<void> register(event, emit) async {
    if (event is RegisterPressed) {
      try {
        final name = event.name;
        final email = event.email;
        final password = event.password;
        final age = event.age;
        final code = event.code;
        final response =
            await authService.register(name, email, password, age, code);
        final data = jsonDecode(response.body);
        print('object code ${data['body']['code']}');
        emit(RegisterSuccess());
      } catch (e) {
        print('Registration failed with error: $e');
      }
    }
  }

  Future<void> login(event, emit) async {
    emit(LoginSuccess());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }
}
