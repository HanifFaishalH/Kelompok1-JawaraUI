import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:jawaramobile_1/widgets/Pemasukan_filter.dart';

class KategoriIuran extends StatelessWidget {
  const KategoriIuran({super.key});

  // Data dummy tanpa tanggal
  final List<Map<String, String>> _kategoriIuran = const [
    {
      "no": "1",
      "nama": "Iuran Warga",
      "jenis": "Iuran Bulanan",
      "nominal": "Rp 10.000",
    },
    {
      "no": "2",
      "nama": "Sumbangan Acara",
      "jenis": "Iuran Khusus",
      "nominal": "Rp 20.000",
    },
    {
      "no": "3",
      "nama": "Sewa Lapangan",
      "jenis": "Iuran Khusus",
      "nominal": "Rp 10.000",
    },
  ];

  // void _showFilterDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text("Filter Pemasukan"),
  //         // content: const PemasukanFilter(),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text("Batal"),
  //             onPressed: () => Navigator.of(context).pop(),
  //           ),
  //           ElevatedButton(
  //             child: const Text("Cari"),
  //             onPressed: () {
  //               // TODO: Tambahkan logika filter
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
          "Kategori Iuran",
          style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/menu-pemasukan'),
        ),
        // iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.filter_list),
        //     onPressed: () => _showFilterDialog(context),
        //   ),
        // ],
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
            minWidth: 500,
            columns: const [
              DataColumn2(label: Text('No'), size: ColumnSize.S),
              DataColumn2(label: Text('Nama'), size: ColumnSize.L),
              DataColumn2(label: Text('Jenis')),
              DataColumn2(label: Text('Nominal'), numeric: true),
              DataColumn2(
                label: Center(child: Text('Aksi')),
                size: ColumnSize.L,
              ),
            ],
            rows: _kategoriIuran.map((item) {
              return DataRow(
                cells: [
                  DataCell(Text(item['no']!)),
                  DataCell(Text(item['nama']!)),
                  DataCell(Text(item['jenis']!)),
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
                            context.push('/detail-kategori', extra: item);
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
