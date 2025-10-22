import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jawaramobile_1/widgets/Pemasukan_filter.dart';
import '../../widgets/bottom_navbar.dart';

class Pemasukan extends StatelessWidget {
  const Pemasukan({super.key});

  // Data dummy
  final List<Map<String, String>> _pemasukanData = const [
    {
      "no": "1",
      "nama": "Iuran Bulanan",
      "jenis": "Iuran Warga",
      "tanggal": "15 Oktober 2025",
      "nominal": "Rp 500.000",
    },
    {
      "no": "2",
      "nama": "Sumbangan Acara",
      "jenis": "Donasi",
      "tanggal": "10 Oktober 2025",
      "nominal": "Rp 750.000",
    },
    {
      "no": "3",
      "nama": "Sewa Lapangan",
      "jenis": "Hasil Usaha Kampung",
      "tanggal": "12 Okt 2025",
      "nominal": "Rp 300.000",
    },
    {
      "no": "4",
      "nama": "Sewa Lapangan",
      "jenis": "Hasil Usaha Kampung",
      "tanggal": "12 Okt 2025",
      "nominal": "Rp 300.000",
    },
    {
      "no": "5",
      "nama": "Bantuan Pemerintah",
      "jenis": "Dana Bantuan Pemerintah",
      "tanggal": "12 Okt 2025",
      "nominal": "Rp 5.000.000",
    },
  ];

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Filter Pemasukan"),
          content: SingleChildScrollView(child: const PemasukanFilter()),
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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        elevation: 0,
        title: Text(
          "Semua Pemasukan",
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
        // Body sekarang hanya berisi tabel
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            headingRowColor: MaterialStateProperty.all(
              theme.colorScheme.primary.withOpacity(0.1),
            ),
            headingTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.secondary,
            ),
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
            rows: _pemasukanData.map((item) {
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
                        color: Colors.green[700],
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
                            context.push('/detail-pemasukan-all', extra: item);
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
