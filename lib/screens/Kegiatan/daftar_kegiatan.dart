import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jawaramobile_1/widgets/kegiatan/kegiatan_filter.dart';

class KegiatanScreen extends StatelessWidget {
  const KegiatanScreen({super.key});

  // Data dummy
  final List<Map<String, String>> _kegiatanData = const [
    {
      "no": "1",
      "nama": "Kerja Bakti Bulanan",
      "kategori": "Kebersihan & Keamanan",
      "pj": "Pak RT",
      "tanggal": "25 Okt 2025",
      "lokasi": "Lingkungan RT 05",
      "deskripsi": "Membersihkan selokan dan area umum.",
    },
    {
      "no": "2",
      "nama": "Rapat Karang Taruna",
      "kategori": "Komunitas & Sosial",
      "pj": "Ketua Karuna",
      "tanggal": "22 Okt 2025",
      "lokasi": "Balai Warga",
      "deskripsi": "Membahas rencana kegiatan akhir tahun.",
    },
  ];

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Filter Kegiatan"),
          content: const KegiatanFilter(),
          actions: <Widget>[
            TextButton(
              child: const Text("Batal"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text("Cari"),
              onPressed: () {
                // TODO: Tambahkan logika filter
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Konfirmasi Hapus"),
          content: const Text(
            "Apakah Anda yakin ingin menghapus kegiatan ini? Aksi ini tidak dapat dibatalkan.",
          ),
          actions: [
            TextButton(
              child: const Text("Batal"),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text("Hapus"),
              onPressed: () {
                // TODO: Implementasikan logika untuk menghapus data dari database/server
                Navigator.of(dialogContext).pop();
                context.pop(); // Kembali ke halaman daftar kegiatan
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Kegiatan berhasil dihapus')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text(
          "Kegiatan",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
        // Tambahkan tombol filter di sini
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/tambah-kegiatan'),
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 700,
            columns: const [
              DataColumn2(label: Text('No'), size: ColumnSize.S),
              DataColumn2(label: Text('Nama Kegiatan'), size: ColumnSize.L),
              DataColumn2(label: Text('Penanggung Jawab'), size: ColumnSize.L),
              DataColumn2(label: Text('Tanggal')),
              DataColumn2(
                label: Center(child: Text('Aksi')),
                size: ColumnSize.L,
              ),
            ],
            rows: _kegiatanData.map((item) {
              return DataRow(
                cells: [
                  DataCell(Text(item['no']!)),
                  DataCell(Text(item['nama']!)),
                  DataCell(Text(item['pj']!)),
                  DataCell(Text(item['tanggal']!)),
                  DataCell(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            size: 20,
                            color: theme.colorScheme.primary,
                          ),
                          onPressed: () =>
                              context.push('/detail-kegiatan', extra: item),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.orange.shade700,
                          ),
                          onPressed: () =>
                              context.push('/edit-kegiatan', extra: item),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 20,
                            color: theme.colorScheme.error,
                          ),
                          onPressed: () => _showDeleteConfirmation(context),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
