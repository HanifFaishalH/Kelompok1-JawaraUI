import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jawaramobile_1/screens/Auth/login_screens.dart';
import 'package:jawaramobile_1/screens/Auth/register_screens.dart';

// ====== Screens Utama ======
import 'package:jawaramobile_1/screens/dashboard_screen.dart';
import 'package:jawaramobile_1/screens/menu_screen.dart';
import 'package:jawaramobile_1/screens/data_warga_rumah.dart';

// ====== Pemasukan ======
import 'package:jawaramobile_1/screens/Pemasukan/menu_pemasukan.dart';
import 'package:jawaramobile_1/screens/Pemasukan/kategori_iuran.dart';
import 'package:jawaramobile_1/screens/Pemasukan/detail_kategori_iuran.dart';
import 'package:jawaramobile_1/screens/Pemasukan/tagih_iuran_page.dart';

// ====== Pengeluaran ======
import 'package:jawaramobile_1/screens/pengeluaran/pengeluaran_screen.dart';
import 'package:jawaramobile_1/screens/pengeluaran/tambah_pengeluaran_screen.dart';
import 'package:jawaramobile_1/screens/pengeluaran/detail_pengeluaran_screen.dart';

// ====== Laporan Keuangan ======
import 'package:jawaramobile_1/screens/LaporanKeuangan/semua_pengeluaran.dart';
import 'package:jawaramobile_1/screens/LaporanKeuangan/detail_pengeluaran.dart';
import 'package:jawaramobile_1/screens/LaporanKeuangan/semua_pemasukan.dart';
import 'package:jawaramobile_1/screens/LaporanKeuangan/detail_pemasukan.dart';
import 'package:jawaramobile_1/screens/LaporanKeuangan/cetak_laporan_screen.dart';
import 'package:jawaramobile_1/screens/LaporanKeuangan/menu_laporan_keuangan.dart';

// ====== Kegiatan ======
import 'package:jawaramobile_1/screens/kegiatan/daftar_kegiatan.dart';
import 'package:jawaramobile_1/screens/kegiatan/tambah_kegiatan.dart';
import 'package:jawaramobile_1/screens/Kegiatan/detail_kegiatan.dart';
import 'package:jawaramobile_1/screens/Kegiatan/edit_kegiatan.dart';

// ====== Lainnya ======
import 'package:jawaramobile_1/screens/penerimaan_warga_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: <GoRoute>[
    // ====== Autentikasi ======
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreens(),
    ),

    // ====== Dashboard & Menu ======
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    // ====== Popup Menu ======
    GoRoute(
      path: '/menu-popup',
      name: 'menu-popup',
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Center(),
      ),
    ),

    // ====== Data Warga ======
    GoRoute(
      path: '/data-warga-rumah',
      name: 'data-warga-rumah',
      builder: (context, state) => const DataWargaPage(),
    ),

    // ====== Pemasukan ======
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
        final data = state.extra as Map<String, String>;
        return DetailKategoriIuran(kategoriData: data);
      },
    ),
    GoRoute(
      path: '/tagih-iuran',
      name: 'tagih-iuran',
      builder: (context, state) => const TagihIuranPage(),
    ),

    // ====== Pengeluaran ======
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
        final data = state.extra as Map<String, String>;
        return DetailPengeluaranScreen(pengeluaranData: data);
      },
    ),

    // ====== Laporan Keuangan ======
    GoRoute(
      path: '/laporan-keuangan',
      name: 'laporan-keuangan',
      builder: (context, state) => const MenuLaporanKeuangan(),
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
        final data = state.extra as Map<String, String>;
        return DetailPemasukan(pemasukanData: data);
      },
    ),
    GoRoute(
      path: '/cetak-laporan',
      name: 'cetak-laporan',
      builder: (context, state) => const CetakLaporanScreen(),
    ),

    // ====== Kegiatan ======
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

    // ====== Lain-lain ======
    GoRoute(
      path: '/penerimaan-warga',
      name: 'penerimaan-warga',
      builder: (context, state) => const PenerimaanWargaScreen(),
    ),
  ],
);
