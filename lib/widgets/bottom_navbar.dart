import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;

  final items = const [
    {'icon': FontAwesomeIcons.house, 'label': 'Home'},
    {'icon': FontAwesomeIcons.fileLines, 'label': 'Laporan'},
    {'icon': FontAwesomeIcons.bars, 'label': 'Menu'},
    {'icon': FontAwesomeIcons.userGroup, 'label': 'Pengguna'},
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => setState(() => selectedIndex = index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface.withOpacity(0.5),
      backgroundColor: colorScheme.surface,
      items: items
          .map((e) => BottomNavigationBarItem(
        icon: FaIcon(e['icon'] as IconData),
        label: e['label'] as String,
      ))
          .toList(),
    );
  }
}
