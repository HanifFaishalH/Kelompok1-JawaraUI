import 'package:go_router/go_router.dart';
import 'package:jawaramobile_1/screens/dashboard_screen.dart';
import 'package:jawaramobile_1/screens/login_screens.dart';
import 'package:jawaramobile_1/screens/register_screens.dart';
import 'package:jawaramobile_1/screens/menu_screen.dart';
import 'package:jawaramobile_1/screens/pengeluaran_screen.dart';
import 'package:jawaramobile_1/screens/tambah_pengeluaran_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: <GoRoute>[
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreens(),
    ),
    GoRoute(
      path: '/menu',
      name: 'menu',
      builder: (context, state) => const MenuScreen(),
    ),
    GoRoute(
      path: '/pengeluaran',
      name: 'pengeluaran',
      builder: (context, state) => const PengeluaranScreen(),
    ),
    GoRoute(
      path: '/tambah-pengeluaran',
      name: 'tambah-pengeluaran',
      builder: (context, state) => const TambahPengeluaranScreen(),
    ),
  ],
);
