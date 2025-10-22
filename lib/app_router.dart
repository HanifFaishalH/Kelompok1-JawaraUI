import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jawaramobile_1/screens/Auth/login_screens.dart';
import 'package:jawaramobile_1/screens/Auth/register_screens.dart';
import 'package:jawaramobile_1/screens/Mutasi/mutasi_detail_page.dart';
import 'package:jawaramobile_1/screens/Mutasi/mutasi_page.dart';

// ====== Screens Utama ======
import 'package:jawaramobile_1/screens/dashboard_screen.dart';
import 'package:jawaramobile_1/screens/data_warga_rumah.dart';

// ====== Pemasukan ======
import 'package:jawaramobile_1/screens/Pemasukan/menu_pemasukan.dart';
import 'package:jawaramobile_1/screens/Pemasukan/kategori_iuran.dart';
import 'package:jawaramobile_1/screens/Pemasukan/detail_kategori_iuran.dart';
import 'package:jawaramobile_1/screens/Pemasukan/tagih_iuran_page.dart';
import 'package:jawaramobile_1/screens/Pemasukan/daftar_tagihan.dart';
import 'package:jawaramobile_1/screens/Pemasukan/detail_tagihan.dart';
import 'package:jawaramobile_1/screens/Pemasukan/lain_lain.dart';

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
import 'package:jawaramobile_1/screens/Kegiatan/daftar_kegiatan.dart';
import 'package:jawaramobile_1/screens/Kegiatan/tambah_kegiatan.dart';
import 'package:jawaramobile_1/screens/Kegiatan/detail_kegiatan.dart';
import 'package:jawaramobile_1/screens/Kegiatan/edit_kegiatan.dart';

// ====== Broadcast ======
import 'package:jawaramobile_1/screens/Broadcast/daftar_broadcast.dart';
import 'package:jawaramobile_1/screens/Broadcast/tambah_broadcast.dart';
import 'package:jawaramobile_1/screens/Broadcast/detail_broadcast.dart';
import 'package:jawaramobile_1/screens/Broadcast/edit_broadcast.dart';

// ====== Manajemen Pengguna ======
import 'package:jawaramobile_1/screens/ManajemenPengguna/daftar_pengguna_screen.dart';
import 'package:jawaramobile_1/screens/ManajemenPengguna/tambah_pengguna_screen.dart';

// ====== Channel Transfer ======
import 'package:jawaramobile_1/screens/ChannelTransfer/daftar_channel_screen.dart';
import 'package:jawaramobile_1/screens/ChannelTransfer/tambah_channel_screen.dart';

// ====== Lainnya ======
import 'package:jawaramobile_1/screens/penerimaan_warga_screen.dart';
import 'package:jawaramobile_1/screens/dashboard_aspirasi.dart';

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
    GoRoute(
      path: '/daftar-tagihan',
      name: 'daftar-tagihan',
      builder: (context, state) => const DaftarTagihan(),
    ),
    GoRoute(
      path: '/detail-tagihan',
      name: 'detail-tagihan',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;
        return DetailTagihan(kategoriData: data);
      },
    ),
    GoRoute(
      path: '/pemasukan-lain',
      name: 'pemasukan-lain',
      builder: (context, state) => const PemasukanLain(),
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

    // ====== Broadcast ======
    GoRoute(
      path: '/broadcast',
      name: 'broadcast',
      builder: (context, state) => const BroadcastScreen(),
    ),
    GoRoute(
      path: '/tambah-broadcast',
      name: 'tambah-broadcast',
      builder: (context, state) => const TambahBroadcastScreen(),
    ),
    GoRoute(
      path: '/detail-broadcast',
      name: 'detail-broadcast',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;
        return DetailBroadcastScreen(broadcastData: data);
      },
    ),
    GoRoute(
      path: '/edit-broadcast',
      name: 'edit-broadcast',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;
        return EditBroadcastScreen(broadcastData: data);
      },
    ),
    GoRoute(
      path: '/manajemen-pengguna',
      name: 'manajemen-pengguna',
      builder: (context, state) => const DaftarPenggunaScreen(),
    ),

    GoRoute(
      path: '/tambah-pengguna',
      name: 'tambah-pengguna',
      builder: (context, state) => const TambahPenggunaScreen(),
    ),

    GoRoute(
      path: '/daftar-channel',
      name: 'daftar-channel',
      builder: (context, state) => const DaftarChannelScreen(),
    ),
    GoRoute(
      path: '/tambah-channel',
      name: 'tambah-channel',
      builder: (context, state) => const TambahChannelScreen(),
    ),

    GoRoute(
    path: '/channel-transfer',
    name: 'channel-transfer',
    builder: (context, state) => const DaftarChannelScreen(), // arahkan ke daftar
  ),

    // ====== Lain-lain ======
    GoRoute(
      path: '/penerimaan-warga',
      name: 'penerimaan-warga',
      builder: (context, state) => const PenerimaanWargaScreen(),
    ),

    GoRoute(
      path: '/mutasi',
      name: 'mutasi',
      builder: (context, state) => MutasiPage(),
    ),

    GoRoute(
      path: '/mutasi-detail',
      name: 'mutasi-detail',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return MutasiDetailPage(data: data);
      },
    ),
    GoRoute(
      path: '/dashboard-aspirasi',
      name: 'dashboard-aspirasi', 
      builder: (context, state) => const DashboardAspirasi(),
      ),
      ], 
);
