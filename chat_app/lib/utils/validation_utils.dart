bool validatePassword(String password) {
  return password.length >= 6;
}

bool validatePhoneNumber(String phone) {
  final regex = RegExp(r'^\+?[0-9]{10,13}$');
  return regex.hasMatch(phone);
}

bool validateEmail(String email) {
  final regex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  return regex.hasMatch(email);
}
