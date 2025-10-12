import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widget/dashboard_card.dart'; // Kita tetap gunakan widget kartu yang sudah ada

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Daftar semua menu yang akan ditampilkan di GridView
    final List<Map<String, dynamic>> menuItems = [
      {'icon': FontAwesomeIcons.wallet, 'title': 'Pemasukan'},
      {'icon': FontAwesomeIcons.receipt, 'title': 'Pengeluaran'},
      {'icon': FontAwesomeIcons.chartPie, 'title': 'Laporan'},
      {'icon': FontAwesomeIcons.users, 'title': 'Data Warga'},
      {'icon': FontAwesomeIcons.calendarCheck, 'title': 'Kegiatan'},
      {'icon': FontAwesomeIcons.bullhorn, 'title': 'Broadcast'},
      {'icon': FontAwesomeIcons.peopleRoof, 'title': 'Mutasi'},
      {'icon': FontAwesomeIcons.grip, 'title': 'Lainnya'},
    ];

    return Scaffold(
      // AppBar sekarang lebih sederhana, tanpa TabBar
      appBar: AppBar(
        title: const Text('Dashboard Warga'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Aksi untuk notifikasi
            },
          ),
        ],
      ),
      // Gunakan SingleChildScrollView agar bisa di-scroll jika kontennya banyak
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bagian Header/Sapaan
                Text(
                  'Selamat Pagi,',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
                Text(
                  'Admin!', // Ganti dengan nama pengguna
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 24),

                // GridView untuk menu
                GridView.builder(
                  // physics dan shrinkWrap penting agar GridView di dalam Column bisa di-scroll
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 kolom, mirip contoh Anda
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.9, // Sesuaikan rasio agar pas
                  ),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return DashboardCard(
                      icon: item['icon'],
                      title: item['title'],
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${item['title']} di-tap!')),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 24),

                // Contoh bagian lain di dashboard, misal: Pengumuman
                Text(
                  'Pengumuman Terbaru',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Icon(Icons.campaign, color: Theme.of(context).colorScheme.primary),
                    title: const Text('Kerja Bakti Lingkungan RT 05'),
                    subtitle: const Text('Minggu, 12 Oktober 2025, Pukul 07:00'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}