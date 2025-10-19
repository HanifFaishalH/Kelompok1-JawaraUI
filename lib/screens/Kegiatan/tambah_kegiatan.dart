import 'package:flutter/material.dart';
import 'package:jawaramobile_1/widgets/kegiatan/tambah_kegiatan_form.dart';

class TambahKegiatanScreen extends StatelessWidget {
  const TambahKegiatanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text(
          "Tambah Kegiatan",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.9)),
        child: const SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: TambahKegiatanForm(),
        ),
      ),
    );
  }
}
