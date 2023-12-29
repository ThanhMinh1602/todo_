part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent extends Equatable {
  const SplashEvent();
  @override
  List<Object?> get props => [];
}

class MoveToLoginScreen
    extends SplashEvent {}// sự kiện di chuyển đến màn hình đăng nhập


 
