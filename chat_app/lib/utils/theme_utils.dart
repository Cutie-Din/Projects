import 'package:flutter/material.dart';

class AppThemes {
  //TODO: Light Theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 63, 17, 177),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFFEDEDED),
      foregroundColor: const Color(0xFF603BB5),
      elevation: 2,
    ),
    cardTheme: const CardTheme(
      color: Color(0xFFF5F5F5),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF603BB5),
        foregroundColor: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Color(0xFF212121),
      ),
    ),
  );
  //TODO: Dark Theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF05637D),
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E),
      foregroundColor: const Color(0xFF90CAF9),
      elevation: 2,
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF2E2E2E),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF05637D),
        foregroundColor: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Color(0xFFE0E0E0),
      ),
    ),
  );

  static ThemeMode themeMode = ThemeMode.system;

  static void switchThemeMode(bool isDarkModeEnabled) {
    themeMode = isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
  }
}

// Example Helper Functions
bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

bool isLightMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}
