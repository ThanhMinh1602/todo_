part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final String error;

  const LoginFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class LoginError extends AuthState {
  final String errorMessage;

  const LoginError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class LoggedOut extends AuthState {}

//otp
class OtpInitial extends AuthState {}

class OtpSuccess extends AuthState {}

class OtpFailure extends AuthState {
  final String error;

  const OtpFailure({required this.error});
  @override
  List<Object> get props => [error];
}

// register
//otp
class RegisterInitial extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  final String error;

  const RegisterFailure({required this.error});
  @override
  List<Object> get props => [error];
}
