import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailKegiatanScreen extends StatelessWidget {
  // Data kegiatan diterima dari halaman daftar melalui constructor
  final Map<String, String> kegiatanData;

  const DetailKegiatanScreen({super.key, required this.kegiatanData});

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
                Navigator.of(dialogContext).pop(); // Tutup dialog
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

  // Widget helper untuk membuat baris detail yang rapi (Label: Value)
  Widget _buildDetailRow(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        elevation: 0,
        title: Text(
          "Detail Kegiatan",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.9)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Card untuk menampilkan detail utama
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      _buildDetailRow(
                        context,
                        "Nama Kegiatan",
                        kegiatanData['nama'] ?? '-',
                      ),
                      const Divider(height: 1),
                      _buildDetailRow(
                        context,
                        "Kategori",
                        kegiatanData['kategori'] ?? '-',
                      ),
                      const Divider(height: 1),
                      _buildDetailRow(
                        context,
                        "Penanggung Jawab",
                        kegiatanData['pj'] ?? '-',
                      ),
                      const Divider(height: 1),
                      _buildDetailRow(
                        context,
                        "Lokasi",
                        kegiatanData['lokasi'] ?? '-',
                      ),
                      const Divider(height: 1),
                      _buildDetailRow(
                        context,
                        "Tanggal",
                        kegiatanData['tanggal'] ?? '-',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Bagian untuk menampilkan deskripsi
              Text(
                'Deskripsi',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                kegiatanData['deskripsi'] ?? 'Tidak ada deskripsi.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 40),

              // Tombol Aksi (Edit dan Hapus)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.delete_outline),
                      label: const Text('Hapus'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.colorScheme.error,
                        side: BorderSide(color: theme.colorScheme.error),
                      ),
                      onPressed: () => _showDeleteConfirmation(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.edit_outlined),
                      label: const Text('Edit'),
                      onPressed: () {
                        // Navigasi ke halaman edit sambil mengirim data kegiatan
                        context.push('/edit-kegiatan', extra: kegiatanData);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
