import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(16),
      children: [
        Text("Tabel Data Warga",
            style: theme.textTheme.titleLarge?.copyWith(color: colorScheme.primary)),
        const SizedBox(height: 8),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor:
              WidgetStateProperty.all(colorScheme.primaryContainer),
              headingTextStyle: theme.textTheme.titleSmall
                  ?.copyWith(color: colorScheme.onPrimaryContainer),
              columns: const [
                DataColumn(label: Text("Nama")),
                DataColumn(label: Text("NIK")),
                DataColumn(label: Text("Umur")),
                DataColumn(label: Text("Pekerjaan")),
              ],
              rows: warga
                  .map(
                    (w) => DataRow(cells: [
                  DataCell(Text(w["nama"])),
                  DataCell(Text(w["nik"])),
                  DataCell(Text("${w["umur"]}")),
                  DataCell(Text(w["pekerjaan"])),
                ]),
              )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
