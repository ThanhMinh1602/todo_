import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:todo_app/constants/app_api.dart';

abstract class ImplAuthServices {
  Future<http.Response> sendOTP(String email);
  Future<http.Response> login(String email, String password);
  Future<http.Response> register(
      String name, String email, String password, int age, String code);
  Future<http.Response> forgotPassword(
      String email, String password, String code);
  Future<http.Response> changePassword(String password, String old_password);
}

class AuthServices implements ImplAuthServices {
  static final httpLog = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);

  @override
  Future<http.Response> changePassword(String password, String old_password) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<http.Response> forgotPassword(
      String email, String password, String code) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<http.Response> login(String email, String password) async {
    const uri = AppApi.endPointLogin;
    http.Response response = await httpLog.post(Uri.parse(uri),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${null}',
        },
        body: jsonEncode({"email": email, "password": password}));
    return response;
  }

  @override
  Future<http.Response> register(
      String name, String email, String password, int age, String code) async {
    const uri = AppApi.endPointAuthRegister;
    http.Response response = await httpLog.post(Uri.parse(uri),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${null}',
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "age": age,
          "code": code
        }));
    return response;
  }

  @override
  Future<http.Response> sendOTP(String email) async {
    const uri = AppApi.endPointOtp;
    http.Response response = await httpLog.post(Uri.parse(uri),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${null}',
        },
        body: jsonEncode({"email": email}));
    return response;
  }
}
