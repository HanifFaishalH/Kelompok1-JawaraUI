import 'package:flutter/material.dart';

class DataWargaScreen extends StatelessWidget {
  const DataWargaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Warga & Rumah'),
      ),
      body: const Center(
        child: Text('Konten untuk Data Warga & Rumah akan ada di sini.'),
      ),
    );
  }
}