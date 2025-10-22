import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart'; // ✅ pastikan tambahkan di pubspec.yaml

class TabelKeluarga extends StatelessWidget {
  const TabelKeluarga({super.key});

  final List<Map<String, dynamic>> keluarga = const [
    {"nama_keluarga": "Keluarga Ijat", "jumlah_anggota": 4, "alamat": "Jl. Kenanga No.12"},
    {"nama_keluarga": "Keluarga Mara Nunez", "jumlah_anggota": 3, "alamat": "Jl. Melati No.8"},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        Text(
          "Tabel Data Keluarga",
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          color: colorScheme.surface,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 0, // biar otomatis sesuai lebar layar
              headingRowColor: WidgetStateProperty.all(colorScheme.primaryContainer),
              headingTextStyle: theme.textTheme.titleSmall
                  ?.copyWith(color: colorScheme.onPrimaryContainer),
              columns: const [
                DataColumn2(label: Text("Nama Keluarga"), size: ColumnSize.L),
                DataColumn2(label: Text("Jumlah Anggota"), size: ColumnSize.S),
                DataColumn2(label: Text("Alamat"), size: ColumnSize.L),
              ],
              rows: keluarga.map(
                    (k) {
                  return DataRow(
                    cells: [
                      DataCell(Text(k["nama_keluarga"], style: theme.textTheme.bodyMedium)),
                      DataCell(Text("${k["jumlah_anggota"]}", style: theme.textTheme.bodyMedium)),
                      DataCell(Text(k["alamat"], style: theme.textTheme.bodyMedium)),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
