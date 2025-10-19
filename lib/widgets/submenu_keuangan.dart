import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showSubMenuKeuangan(BuildContext context) {
  showDialog(
    context: context,
    // Gunakan 'dialogContext' untuk menutup dialog, dan 'context' untuk navigasi
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text("Pilih Laporan Keuangan"),
        contentPadding: const EdgeInsets.only(top: 20.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.arrow_circle_down_outlined),
              title: const Text("Semua Pemasukan"),
              onTap: () {
                Navigator.of(dialogContext).pop(); // Tutup dialog dulu
                // TODO: Ganti notifikasi ini dengan navigasi jika halaman sudah dibuat
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Fitur "Semua Pemasukan" sedang dikembangkan',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_circle_up_outlined),
              title: const Text("Semua Pengeluaran"),
              onTap: () {
                Navigator.of(dialogContext).pop(); // Tutup dialog dulu
                context.push(
                  '/semua-pengeluaran',
                ); // Navigasi ke halaman pengeluaran
              },
            ),
            ListTile(
              leading: const Icon(Icons.print_outlined),
              title: const Text("Cetak Laporan"),
              onTap: () {
                Navigator.of(dialogContext).pop(); // Tutup dialog dulu
                // TODO: Ganti notifikasi ini dengan logika cetak
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fitur "Cetak Laporan" sedang dikembangkan'),
                  ),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Batal"),
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Tombol untuk menutup dialog
            },
          ),
        ],
      );
    },
  );
}
