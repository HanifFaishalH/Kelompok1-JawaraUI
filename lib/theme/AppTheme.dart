import 'package:flutter/material.dart';

class AppTheme {
  // Palet warna
  static const Color darkPurple = Color(0xFF4C008D);
  static const Color brightPurple = Color(0xFF7F00FF);
  static const Color lightPurple = Color(0xFFD8BFD8);
  static const Color offWhite = Color(0xFFFAF0E6);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent, // biar gradasi kelihatan
    colorScheme: ColorScheme(
      primary: brightPurple,
      onPrimary: offWhite,
      primaryContainer: lightPurple,
      onPrimaryContainer: darkPurple,
      secondary: darkPurple,
      onSecondary: offWhite,
      secondaryContainer: lightPurple,
      onSecondaryContainer: darkPurple,
      background: offWhite,
      onBackground: darkPurple,
      surface: offWhite,
      onSurface: darkPurple,
      surfaceVariant: lightPurple,
      onSurfaceVariant: darkPurple,
      error: Colors.red.shade700,
      onError: Colors.white,
      errorContainer: Colors.red.shade100,
      onErrorContainer: Colors.red.shade900,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: offWhite,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: brightPurple,
        foregroundColor: offWhite,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: darkPurple),
      titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: darkPurple),
      bodyLarge: TextStyle(fontSize: 16.0, color: darkPurple),
      bodyMedium: TextStyle(fontSize: 14.0, color: darkPurple),
    ),
  );
}
