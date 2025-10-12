import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'data_warga.dart'; // Contoh halaman lain
import 'more_screen.dart';       // Halaman "Lainnya"

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Indeks halaman yang aktif di BottomNavBar

  // Daftar halaman yang akan ditampilkan
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    DataWargaScreen(), // Ganti dengan halaman sebenarnya untuk Data Warga & Rumah
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar sudah ada di DashboardScreen, jadi tidak perlu di sini
      // Untuk halaman lain yang butuh AppBar, bisa ditambahkan di masing-masing screen

      body: _widgetOptions.elementAt(_selectedIndex), // Menampilkan halaman sesuai indeks
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard, color: Theme.of(context).colorScheme.primary),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people_alt_outlined),
            activeIcon: Icon(Icons.people_alt, color: Theme.of(context).colorScheme.primary),
            label: 'Warga',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.more_horiz_outlined),
            activeIcon: Icon(Icons.more_horiz, color: Theme.of(context).colorScheme.primary),
            label: 'Lainnya',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary, // Warna ikon/teks aktif
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant, // Warna ikon/teks tidak aktif
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).colorScheme.surface, // Warna background bottom nav
        type: BottomNavigationBarType.fixed, // Penting untuk lebih dari 3 item
      ),
    );
  }
}