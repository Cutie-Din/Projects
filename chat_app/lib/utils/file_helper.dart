import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<File> getLocalFile(String fileName) async {
  final directory = await getApplicationDocumentsDirectory();
  return File('${directory.path}/$fileName');
}

Future<void> writeToFile(String fileName, String content) async {
  final file = await getLocalFile(fileName);
  await file.writeAsString(content);
}

Future<String> readFromFile(String fileName) async {
  final file = await getLocalFile(fileName);
  return await file.readAsString();
}
