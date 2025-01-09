import 'package:cat_auth_clean_architecture/features/authentication/domain/entities/cat_signin.dart';

class CatSignInModel extends CatSignIn {
  final String id;
  final String username;
  final String email;
  final String token;

  CatSignInModel({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
  }) : super(email, '');

  factory CatSignInModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'] ?? {};
    return CatSignInModel(
      id: user['_id'] ?? '',
      username: user['username'] ?? '',
      email: user['email'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
