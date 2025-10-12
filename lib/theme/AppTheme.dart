import 'package:flutter/material.dart';

class AppTheme {
  // Warna kustom dari palet yang diberikan
  static const Color _darkPurple = Color(0xFF4C008D); // Ungu Tua
  static const Color _brightPurple = Color(0xFF7F00FF); // Ungu Cerah
  static const Color _lightPurple = Color(0xFFD8BFD8); // Ungu Muda/Lavender
  static const Color _offWhite = Color(0xFFFAF0E6); // Krem/Putih Pucat

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      // Atur primary color ke Ungu Cerah
      primary: _brightPurple,
      onPrimary: _offWhite, // Teks/ikon di atas primary color
      primaryContainer: _lightPurple, // Varian lighter dari primary
      onPrimaryContainer: _darkPurple, // Teks/ikon di atas primaryContainer

      // Secondary colors bisa kita sesuaikan juga
      secondary: _darkPurple,
      onSecondary: _offWhite,
      secondaryContainer: _lightPurple.withOpacity(0.5),
      onSecondaryContainer: _darkPurple,

      // Warna untuk background
      background: _offWhite,
      onBackground: _darkPurple,

      // Warna untuk permukaan (Card, AlertDialog, dll.)
      surface: _offWhite,
      onSurface: _darkPurple,
      surfaceVariant: _lightPurple.withOpacity(0.3),
      onSurfaceVariant: _darkPurple,

      // Warna error
      error: Colors.red.shade700,
      onError: Colors.white,
      errorContainer: Colors.red.shade100,
      onErrorContainer: Colors.red.shade900,

      // Other properties
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkPurple, // AppBar menggunakan Ungu Tua
      foregroundColor: _offWhite,    // Warna teks/ikon di AppBar
      elevation: 4.0,
      centerTitle: false,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _brightPurple, // Tombol menggunakan Ungu Cerah
        foregroundColor: _offWhite,     // Warna teks di tombol
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: _darkPurple),
      titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: _darkPurple),
      bodyLarge: TextStyle(fontSize: 16.0, color: _darkPurple.withOpacity(0.8)),
      bodyMedium: TextStyle(fontSize: 14.0, color: _darkPurple.withOpacity(0.6)),
    ),
  );

  // Anda bisa menambahkan tema gelap di sini, mungkin membalikkan penggunaan warna
  static final ThemeData darkTheme = ThemeData(
    // ... Konfigurasi tema gelap dengan palet yang sama atau yang disesuaikan
  );
}