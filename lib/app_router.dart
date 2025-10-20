import 'package:go_router/go_router.dart';
import 'package:jawaramobile_1/screens/Pemasukan/detail_kategori_iuran.dart';
import 'package:jawaramobile_1/screens/Pemasukan/kategori_iuran.dart';
import 'package:jawaramobile_1/screens/dashboard_screen.dart';
import 'package:jawaramobile_1/screens/Auth/login_screens.dart';
import 'package:jawaramobile_1/screens/Auth/register_screens.dart';
import 'package:jawaramobile_1/screens/menu_screen.dart';
import 'package:jawaramobile_1/screens/Pemasukan/menu_pemasukan.dart';
import 'package:jawaramobile_1/screens/pengeluaran/pengeluaran_screen.dart';
import 'package:jawaramobile_1/screens/pengeluaran/tambah_pengeluaran_screen.dart';
import 'package:jawaramobile_1/screens/pengeluaran/detail_pengeluaran_screen.dart';
import 'package:jawaramobile_1/screens/LaporanKeuangan/semua_pengeluaran.dart';
import 'package:jawaramobile_1/screens/LaporanKeuangan/detail_pengeluaran.dart';
import 'package:jawaramobile_1/screens/LaporanKeuangan/semua_pemasukan.dart';
import 'package:jawaramobile_1/screens/LaporanKeuangan/detail_pemasukan.dart';
import 'package:jawaramobile_1/screens/LaporanKeuangan/cetak_laporan_screen.dart';
import 'package:jawaramobile_1/screens/penerimaan_warga_screen.dart';
import 'package:jawaramobile_1/screens/kegiatan/daftar_kegiatan.dart';
import 'package:jawaramobile_1/screens/kegiatan/tambah_kegiatan.dart';
import 'package:jawaramobile_1/screens/Kegiatan/detail_kegiatan.dart';
import 'package:jawaramobile_1/screens/Kegiatan/edit_kegiatan.dart';
import 'package:jawaramobile_1/screens/LogActivity/log_activity_screen.dart';
import 'package:jawaramobile_1/screens/LogActivity/detail_log_activity_screen.dart';

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
      path: '/menu-pemasukan',
      name: 'menu-pemasukan',
      builder: (context, state) => const MenuPemasukan(),
    ),
    GoRoute(
      path: '/kategori-iuran',
      name: 'kategori-iuran',
      builder: (context, state) => const KategoriIuran(),
    ),
    GoRoute(
      path: '/detail-kategori',
      name: 'detail-kategori',
      builder: (context, state) {
        // Ambil data yang dikirimkan melalui 'extra'
        final data = state.extra as Map<String, String>;
        return DetailKategoriIuran(kategoriData: data);
      },
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
    GoRoute(
      path: '/detail-pengeluaran',
      name: 'detail-pengeluaran',
      builder: (context, state) {
        // Ambil data yang dikirimkan melalui 'extra'
        final data = state.extra as Map<String, String>;
        return DetailPengeluaranScreen(pengeluaranData: data);
      },
    ),
    GoRoute(
      path: '/semua-pengeluaran',
      name: 'semua-pengeluaran',
      builder: (context, state) => const Pengeluaran(),
    ),
    GoRoute(
      path: '/detail-pengeluaran-all',
      name: 'detail-pengeluaran-all',
      builder: (context, state) {
        // Ambil data yang dikirimkan melalui 'extra'
        final data = state.extra as Map<String, String>;
        return DetailPengeluaran(pengeluaranData: data);
      },
    ),
    GoRoute(
      path: '/semua-pemasukan',
      name: 'semua-pemasukan',
      builder: (context, state) => const Pemasukan(),
    ),
    GoRoute(
      path: '/detail-pemasukan-all',
      name: 'detail-pemasukan-all',
      builder: (context, state) {
        // Ambil data yang dikirimkan melalui 'extra'
        final data = state.extra as Map<String, String>;
        return DetailPemasukan(pemasukanData: data);
      },
    ),
    GoRoute(
      path: '/cetak-laporan',
      name: 'cetak-laporan',
      builder: (context, state) => const CetakLaporanScreen(),
    ),
    GoRoute(
      path: '/penerimaan-warga',
      name: 'penerimaan-warga',
      builder: (context, state) => const PenerimaanWargaScreen(),
    ),
    GoRoute(
      path: '/kegiatan',
      name: 'kegiatan',
      builder: (context, state) => const KegiatanScreen(),
    ),
    GoRoute(
      path: '/tambah-kegiatan',
      name: 'tambah-kegiatan',
      builder: (context, state) => const TambahKegiatanScreen(),
    ),
    GoRoute(
      path: '/detail-kegiatan',
      name: 'detail-kegiatan',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;
        return DetailKegiatanScreen(kegiatanData: data);
      },
    ),
    GoRoute(
      path: '/edit-kegiatan',
      name: 'edit-kegiatan',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;
        return EditKegiatanScreen(kegiatanData: data);
      },
    ),
    GoRoute(
      path: '/log-aktivitas',
      name: 'log-aktivitas',
      builder: (context, state) => const LogActivityScreen(),
    ),
    GoRoute(
      path: '/detail-log-aktivitas',
      name: 'detail-log-aktivitas',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;
        return DetailLogActivityScreen(logData: data);
      },
    ),
  ],
);
