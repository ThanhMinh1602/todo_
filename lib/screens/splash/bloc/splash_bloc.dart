import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<MoveToLoginScreen>(_moveToLogin);
  }

  Future<void> _moveToLogin(
      MoveToLoginScreen event, Emitter<SplashState> emit) async {
    emit(SplashInitial());
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        emit(SplashSuccess());
      },
    );
  }
}
