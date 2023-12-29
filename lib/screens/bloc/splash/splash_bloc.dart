import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/screens/login/login_screen.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final BuildContext context;
  SplashBloc(this.context) : super(SplashInitial()) {
    on<SplashEvent>(moveToLogin);
  }
  Future<void> moveToLogin(event, emit) async {
    if (event is MoveToLoginScreen) {
      await Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          emit(SplashSuccess()); // Phát ra trạng thái thành công
        },
      );
    }
  }
}
