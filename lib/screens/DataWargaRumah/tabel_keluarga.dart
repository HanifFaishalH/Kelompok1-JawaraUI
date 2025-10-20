import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(16),
      children: [
        Text("Tabel Data Keluarga",
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
                DataColumn(label: Text("Nama Keluarga")),
                DataColumn(label: Text("Jumlah Anggota")),
                DataColumn(label: Text("Alamat")),
              ],
              rows: keluarga
                  .map(
                    (k) => DataRow(cells: [
                  DataCell(Text(k["nama_keluarga"])),
                  DataCell(Text("${k["jumlah_anggota"]}")),
                  DataCell(Text(k["alamat"])),
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
