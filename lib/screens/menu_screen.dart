import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.dashboard, 'title': 'Dashboard', 'route': '/dashboard'},
      {'icon': Icons.event_note, 'title': 'Kegiatan', 'route': '/kegiatan'},
      {
        'icon': Icons.home_work,
        'title': 'Data Warga & Rumah',
        'route': '/data-warga',
      },
      {
        'icon': Icons.account_balance_wallet,
        'title': 'Pemasukan',
        'route': '/pemasukan',
      },
      {
        'icon': Icons.monetization_on,
        'title': 'Pengeluaran',
        'route': '/pengeluaran',
      },
      {
        'icon': Icons.assessment,
        'title': 'Laporan Keuangan',
        'route': '/laporan',
      },
      {'icon': Icons.campaign, 'title': 'Broadcast', 'route': '/broadcast'},
      {'icon': Icons.chat_bubble, 'title': 'Pesan Warga', 'route': '/pesan'},
      {
        'icon': Icons.person_add_alt_1,
        'title': 'Penerimaan Warga',
        'route': '/penerimaan-warga',
      },
      {
        'icon': Icons.switch_account,
        'title': 'Mutasi Keluarga',
        'route': '/mutasi',
      },
      {'icon': Icons.history, 'title': 'Log Aktifitas', 'route': '/log'},
      {
        'icon': Icons.manage_accounts,
        'title': 'Manajemen Pengguna',
        'route': '/manajemen-pengguna',
      },
      {
        'icon': Icons.wallet,
        'title': 'Channel Transfer',
        'route': '/channel-transfer',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Menu",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary.withOpacity(0.1),
              theme.colorScheme.background,
            ],
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return _buildMenuItem(
              context,
              icon: item['icon'],
              title: item['title'],
              onTap: () {
                context.push(item['route']);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: theme.colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
