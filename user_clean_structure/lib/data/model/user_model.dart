import '../../domain/entity/user.dart';

class UserModel {
  final String login;
  final String avatar_url;

  const UserModel({
    required this.avatar_url,
    required this.login,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(login: json['login'] ?? '', avatar_url: json['avatar_url'] ?? '');
  }

  User toEntity() {
    return User(login, avatar_url);
  }
}
