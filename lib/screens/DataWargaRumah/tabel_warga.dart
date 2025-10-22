import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart'; // ✅ Tambahkan di pubspec.yaml

class TabelWarga extends StatelessWidget {
  const TabelWarga({super.key});

  final List<Map<String, dynamic>> warga = const [
    {"nama": "Hanif", "nik": "1234567890123456", "umur": 22, "pekerjaan": "Mahasiswa"},
    {"nama": "Siti", "nik": "1234567890123457", "umur": 25, "pekerjaan": "Guru"},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        Text(
          "Tabel Data Warga",
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
              minWidth: 0, // otomatis menyesuaikan lebar layar
              headingRowColor: WidgetStateProperty.all(colorScheme.primaryContainer),
              headingTextStyle: theme.textTheme.titleSmall
                  ?.copyWith(color: colorScheme.onPrimaryContainer),
              border: TableBorder.symmetric(
                inside: BorderSide(color: colorScheme.primary.withOpacity(0.1)),
              ),
              columns: const [
                DataColumn2(label: Text("Nama"), size: ColumnSize.S),
                DataColumn2(label: Text("NIK"), size: ColumnSize.M),
                DataColumn2(label: Text("Umur"), size: ColumnSize.S),
                DataColumn2(label: Text("Pekerjaan"), size: ColumnSize.S),
              ],
              rows: warga.map((w) {
                return DataRow(
                  cells: [
                    DataCell(Text(w["nama"], style: theme.textTheme.bodyMedium)),
                    DataCell(Text(w["nik"], style: theme.textTheme.bodyMedium)),
                    DataCell(Text("${w["umur"]}", style: theme.textTheme.bodyMedium)),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          w["pekerjaan"],
                          style: TextStyle(
                            color: Colors.orange.shade800,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
