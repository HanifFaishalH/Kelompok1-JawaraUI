import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jawaramobile_1/widgets/pengeluaran_filter.dart';
import '../../widgets/bottom_navbar.dart';

class Pengeluaran extends StatelessWidget {
  const Pengeluaran({super.key});

  // Data dummy
  final List<Map<String, String>> _pengeluaranData = const [
    {
      "no": "1",
      "nama": "Beli Sapu",
      "jenis": "Kebersihan",
      "tanggal": "18 Okt 2025",
      "nominal": "Rp 25.000",
    },
    {
      "no": "2",
      "nama": "Bayar Listrik",
      "jenis": "Tagihan",
      "tanggal": "17 Okt 2025",
      "nominal": "Rp 150.000",
    },
    {
      "no": "3",
      "nama": "Iuran Keamanan",
      "jenis": "Wajib",
      "tanggal": "15 Okt 2025",
      "nominal": "Rp 50.000",
    },
    {
      "no": "4",
      "nama": "Lomba 17an",
      "jenis": "Acara",
      "tanggal": "10 Agu 2025",
      "nominal": "Rp 500.000",
    },
  ];

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Filter Pengeluaran"),
          content: const PengeluaranFilter(),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text(
          "Semua Pengeluaran",
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
            minWidth: 600,
            columns: const [
              DataColumn2(label: Text('No'), size: ColumnSize.S),
              DataColumn2(label: Text('Nama'), size: ColumnSize.L),
              DataColumn2(label: Text('Jenis')),
              DataColumn2(label: Text('Tanggal')),
              DataColumn2(label: Text('Nominal'), numeric: true),
              DataColumn2(
                label: Center(child: Text('Aksi')),
                size: ColumnSize.L,
              ),
            ],
            rows: _pengeluaranData.map((item) {
              return DataRow(
                cells: [
                  DataCell(Text(item['no']!)),
                  DataCell(Text(item['nama']!)),
                  DataCell(Text(item['jenis']!)),
                  DataCell(Text(item['tanggal']!)),
                  DataCell(
                    Text(
                      item['nominal']!,
                      style: TextStyle(
                        color: theme.colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
                          onPressed: () {
                            context.push('/detail-pengeluaran', extra: item);
                          },
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
