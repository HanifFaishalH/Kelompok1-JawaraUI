import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart'; // ✅ pastikan sudah ditambahkan di pubspec.yaml

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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        Text(
          "Tabel Data Rumah",
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
              dataRowColor: WidgetStateProperty.resolveWith(
                    (states) => states.contains(WidgetState.selected)
                    ? colorScheme.primary.withOpacity(0.1)
                    : Colors.transparent,
              ),
              border: TableBorder.symmetric(
                inside: BorderSide(color: colorScheme.primary.withOpacity(0.1)),
              ),
              columns: const [
                DataColumn2(label: Text("Alamat"), size: ColumnSize.L),
                DataColumn2(label: Text("Luas"), size: ColumnSize.S),
                DataColumn2(label: Text("Status"), size: ColumnSize.S),
              ],
              rows: rumah.map((r) {
                final isMilikSendiri = r["status"] == "Milik Sendiri";
                return DataRow(
                  cells: [
                    DataCell(Text(r["alamat"], style: theme.textTheme.bodyMedium)),
                    DataCell(Text(r["luas"], style: theme.textTheme.bodyMedium)),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: isMilikSendiri
                              ? Colors.green.shade100
                              : Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          r["status"],
                          style: TextStyle(
                            color: isMilikSendiri
                                ? Colors.green.shade800
                                : Colors.orange.shade800,
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
