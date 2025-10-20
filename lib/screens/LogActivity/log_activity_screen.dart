import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jawaramobile_1/widgets/log_aktivitas_filter.dart';

class LogActivityScreen extends StatelessWidget {
  const LogActivityScreen({super.key});

  // Dummy data – samakan format dengan tabel web kamu: No, Deskripsi, Aktor, Tanggal
  final List<Map<String, String>> _logs = const [
    {
      "no": "1",
      "deskripsi": "Memperbarui transfer channel: BCA",
      "aktor": "Admin Jawara",
      "tanggal": "20 Oktober 2025",
    },
    {
      "no": "2",
      "deskripsi": "Menambahkan transfer channel baru: BCA",
      "aktor": "Admin Jawara",
      "tanggal": "19 Oktober 2025",
    },
    {
      "no": "3",
      "deskripsi": "Menyetujui pesan warga: titooit",
      "aktor": "Admin Jawara",
      "tanggal": "19 Oktober 2025",
    },
    {
      "no": "4",
      "deskripsi": "Menambahkan rumah baru: jalan suhat",
      "aktor": "Admin Jawara",
      "tanggal": "19 Oktober 2025",
    },
    {
      "no": "5",
      "deskripsi": "Menambahkan rumah baru: I",
      "aktor": "Admin Jawara",
      "tanggal": "19 Oktober 2025",
    },
    {
      "no": "6",
      "deskripsi": "Menambahkan pengeluaran: Kerja Bakti Rp 50.000",
      "aktor": "Admin Jawara",
      "tanggal": "19 Oktober 2025",
    },
    {
      "no": "7",
      "deskripsi": "Menambahkan pengeluaran: Kerja Bakti Rp 100.000",
      "aktor": "Admin Jawara",
      "tanggal": "19 Oktober 2025",
    },
    {
      "no": "8",
      "deskripsi": "Menolak registrasi dari: asdfghjkl",
      "aktor": "Admin Jawara",
      "tanggal": "19 Oktober 2025",
    },
    {
      "no": "9",
      "deskripsi": "Menambahkan akun: mimin sebagai community_head",
      "aktor": "Admin Jawara",
      "tanggal": "19 Oktober 2025",
    },
    {
      "no": "10",
      "deskripsi":
          "Menugaskan tagihan: Agustusan periode Januari 2025 sebesar Rp 15",
      "aktor": "Admin Jawara",
      "tanggal": "19 Oktober 2025",
    },
  ];

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Filter Log Aktivitas"),
        content: const LogAktivitasFilter(),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: terapkan filter di sini
              Navigator.of(context).pop();
            },
            child: const Text("Terapkan"),
          )
        ],
      ),
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
          "Log Aktivitas",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white.withOpacity(0.9),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 700,
            columns: const [
              DataColumn2(label: Text('No'), size: ColumnSize.S),
              DataColumn2(label: Text('Deskripsi'), size: ColumnSize.L),
              DataColumn2(label: Text('Aktor'), size: ColumnSize.M),
              DataColumn2(label: Text('Tanggal'), size: ColumnSize.M),
              DataColumn2(
                label: Center(child: Text('Aksi')),
                size: ColumnSize.S,
              ),
            ],
            rows: _logs.map((item) {
              return DataRow(
                cells: [
                  DataCell(Text(item['no'] ?? '-')),
                  DataCell(Text(item['deskripsi'] ?? '-')),
                  DataCell(Text(item['aktor'] ?? '-')),
                  DataCell(Text(item['tanggal'] ?? '-')),
                  DataCell(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_red_eye,
                              size: 20, color: theme.colorScheme.primary),
                          onPressed: () =>
                              context.push('/detail-log-aktivitas', extra: item),
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
