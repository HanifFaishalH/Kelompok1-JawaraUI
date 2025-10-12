import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lainnya'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            ListTile(
              leading: Icon(Icons.family_restroom_outlined, color: Theme.of(context).colorScheme.secondary),
              title: Text('Mutasi Keluarga', style: Theme.of(context).textTheme.bodyLarge),
              trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onSurfaceVariant),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ke halaman Mutasi Keluarga')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history, color: Theme.of(context).colorScheme.secondary),
              title: Text('Log Aktifitas', style: Theme.of(context).textTheme.bodyLarge),
              trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onSurfaceVariant),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ke halaman Log Aktifitas')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people_alt_outlined, color: Theme.of(context).colorScheme.secondary),
              title: Text('Manajemen Pengguna', style: Theme.of(context).textTheme.bodyLarge),
              trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onSurfaceVariant),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ke halaman Manajemen Pengguna')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.compare_arrows_outlined, color: Theme.of(context).colorScheme.secondary),
              title: Text('Channel Transfer', style: Theme.of(context).textTheme.bodyLarge),
              trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onSurfaceVariant),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ke halaman Channel Transfer')),
                );
              },
            ),
            const Divider(), // Pemisah visual
            ListTile(
              leading: Icon(Icons.settings_outlined, color: Theme.of(context).colorScheme.secondary),
              title: Text('Pengaturan', style: Theme.of(context).textTheme.bodyLarge),
              trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onSurfaceVariant),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ke halaman Pengaturan')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: Theme.of(context).colorScheme.secondary),
              title: Text('Bantuan', style: Theme.of(context).textTheme.bodyLarge),
              trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onSurfaceVariant),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ke halaman Bantuan')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}