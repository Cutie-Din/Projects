import 'package:flutter/foundation.dart';

void logError(String error, {StackTrace? stackTrace}) {
  debugPrint("Error: $error");
  if (stackTrace != null) {
    debugPrint("StackTrace: $stackTrace");
  }
}

void handleApiError(dynamic error) {
  debugPrint("API Error: $error");
}
