part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginPressed extends AuthEvent {
  final String email;
  final String password;

  const LoginPressed({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

class SendOtpPressed extends AuthEvent {
  final String email;

  const SendOtpPressed({required this.email});
  @override
  List<Object> get props => [email];
}

//  "name": "string",
//   "email": "string",
//   "password": "string",
//   "age": 0,
//   "code": "string"
class RegisterPressed extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final int age;
  final String code;

  const RegisterPressed(
      {required this.name,
      required this.email,
      required this.password,
      required this.age,
      required this.code});
  @override
  List<Object> get props => [name, email, password, age, code];
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}
