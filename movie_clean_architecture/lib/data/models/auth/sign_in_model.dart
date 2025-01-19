import 'package:flutter/material.dart';
import 'package:movie_clean_architecture/domain/auth/entities/sign_in.dart';

class SignInModel {
  final String email;
  final String password;
  final String token;

  SignInModel({
    required this.email,
    required this.password,
    required this.token,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'] ?? {};
    return SignInModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      token: json['token'] ?? '',
    );
  }

  SignIn toSignIn() {
    return SignIn(
      email,
      password,
      token,
    );
  }
}
