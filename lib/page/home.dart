// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../widget/custom_info_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Template'),
      ),
      // DIBUNGKUS DENGAN SAFEAERA
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ... (Konten lainnya tetap sama)
              Text(
                'Selamat Datang!',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Ini adalah contoh penerapan template UI di Flutter.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              const CustomInfoCard(
                icon: Icons.person_outline,
                title: 'Profil Pengguna',
                subtitle: 'Lihat dan edit detail profil Anda.',
              ),
              const SizedBox(height: 16),
              const CustomInfoCard(
                icon: Icons.settings_outlined,
                title: 'Pengaturan',
                subtitle: 'Atur preferensi aplikasi di sini.',
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tombol ditekan!')),
                    );
                  },
                  child: const Text('Lakukan Aksi'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}