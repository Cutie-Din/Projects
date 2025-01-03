String truncate(String text, int maxLength) {
  if (text.length <= maxLength) return text;
  return "${text.substring(0, maxLength)}...";
}

String capitalize(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}
