import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  // Fungsi ini menentukan tab mana yang aktif berdasarkan rute saat ini.
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/laporan')) return 1;
    // Saat di halaman menu, kita tetap ingin 'Menu' yang aktif.
    if (location.startsWith('/menu')) return 2;
    if (location.startsWith('/pengguna')) return 3;
    return 0; // Default ke Home
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        // TODO: Navigasi ke halaman Laporan
        // context.go('/laporan');
        break;
      case 2:
        context.push('/menu');
        break;
      case 3:
        // TODO: Navigasi ke halaman Pengguna
        // context.go('/pengguna');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final items = const [
      {'icon': FontAwesomeIcons.house, 'label': 'Home'},
      {'icon': FontAwesomeIcons.fileLines, 'label': 'Laporan'},
      {'icon': FontAwesomeIcons.bars, 'label': 'Menu'},
      {'icon': FontAwesomeIcons.userGroup, 'label': 'Pengguna'},
    ];

    return BottomNavigationBar(
      currentIndex: _calculateSelectedIndex(context),
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface.withOpacity(0.5),
      backgroundColor: colorScheme.surface,
      items: items
          .map(
            (e) => BottomNavigationBarItem(
              icon: FaIcon(e['icon'] as IconData),
              label: e['label'] as String,
            ),
          )
          .toList(),
    );
  }
}
