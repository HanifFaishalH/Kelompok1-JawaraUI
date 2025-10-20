import 'package:flutter/material.dart';

class TabelRumah extends StatelessWidget {
  const TabelRumah({super.key});

  final List<Map<String, dynamic>> rumah = const [
    {"alamat": "Jl. Melati No.10", "luas": "120 m²", "status": "Milik Sendiri"},
    {"alamat": "Jl. Mawar No.7", "luas": "90 m²", "status": "Kontrak"},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text("Tabel Data Rumah",
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
                DataColumn(label: Text("Alamat")),
                DataColumn(label: Text("Luas")),
                DataColumn(label: Text("Status")),
              ],
              rows: rumah
                  .map(
                    (r) => DataRow(cells: [
                  DataCell(Text(r["alamat"])),
                  DataCell(Text(r["luas"])),
                  DataCell(Text(r["status"])),
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
