import 'package:flutter/material.dart';

import '../../../domain/auth/entities/sign_up.dart';

class SignUpModel {
  final String email;
  final String password;
  final String token;

  SignUpModel({required this.email, required this.password, required this.token});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'] ?? {};
    return SignUpModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      token: json['token'] ?? '',
    );
  }

  SignUp toSignUp() {
    return SignUp(email, password, token);
  }
}
