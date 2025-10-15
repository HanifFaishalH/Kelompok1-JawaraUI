import 'package:flutter/material.dart';
import 'theme/AppTheme.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Warga',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Gunakan tema ungu kamu
      home: const DashboardScreen(),
    );
  }
}
