import 'package:flutter/material.dart';
import 'page/main_page.dart'; // Import MainScreen yang baru
import 'theme/AppTheme.dart';    // Import tema

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainScreen(), // Menggunakan MainScreen sebagai halaman utama
    );
  }
}