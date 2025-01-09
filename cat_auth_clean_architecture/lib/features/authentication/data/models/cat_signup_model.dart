import 'package:cat_auth_clean_architecture/features/authentication/domain/entities/cat_signup.dart';

class CatSignUpModel extends CatSignUp {
  CatSignUpModel(
    super.email,
    super.username,
    super.password,
  );

  factory CatSignUpModel.fromJson(Map<String, dynamic> json) {
    return CatSignUpModel(
      json['email'],
      json['username'],
      json['password'],
    );
  }
}
