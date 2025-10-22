import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DaftarChannelScreen extends StatelessWidget {
  const DaftarChannelScreen({super.key});

  // Dummy data meniru tabel web: NO, NAMA, TIPE, A/N, THUMBNAIL
  final List<Map<String, String>> _rows = const [
    {
      "no": "1",
      "nama": "QRIS Resmi RT 08",
      "tipe": "qris",
      "an": "RW 08 Karangploso",
      "thumb": "qris",
    },
    {
      "no": "2",
      "nama": "BCA",
      "tipe": "bank",
      "an": "jose",
      "thumb": "img",
    },
    {
      "no": "3",
      "nama": "234234",
      "tipe": "ewallet",
      "an": "23234",
      "thumb": "-",
    },
    {
      "no": "4",
      "nama": "Transfer via BCA",
      "tipe": "bank",
      "an": "RT Jawara Karangploso",
      "thumb": "-",
    },
  ];

  Widget _typeChip(String t) {
    Color bg, fg;
    switch (t) {
      case 'bank':
        bg = Colors.indigo.withOpacity(.12); fg = Colors.indigo.shade800; break;
      case 'ewallet':
        bg = Colors.teal.withOpacity(.12); fg = Colors.teal.shade800; break;
      case 'qris':
        bg = Colors.deepPurple.withOpacity(.12); fg = Colors.deepPurple.shade800; break;
      default:
        bg = Colors.grey.withOpacity(.12); fg = Colors.grey.shade800;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Text(t, style: TextStyle(color: fg, fontWeight: FontWeight.w600)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Daftar Channel",
            style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onPrimary)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {
            // TODO: filter (opsional)
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/tambah-channel'),
        child: const Icon(Icons.add_link),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 800,
          columns: const [
            DataColumn2(label: Text('No'), size: ColumnSize.S),
            DataColumn2(label: Text('Nama'), size: ColumnSize.L),
            DataColumn2(label: Text('Tipe'), size: ColumnSize.S),
            DataColumn2(label: Text('A/N'), size: ColumnSize.L),
            DataColumn2(label: Text('Thumbnail'), size: ColumnSize.S),
            DataColumn2(label: Center(child: Text('Aksi')), size: ColumnSize.S),
          ],
          rows: _rows.map((r) {
            return DataRow(cells: [
              DataCell(Text(r['no']!)),
              DataCell(Text(r['nama']!)),
              DataCell(_typeChip(r['tipe']!)),
              DataCell(Text(r['an']!)),
              DataCell(
                (r['thumb'] == 'img')
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 48, height: 48,
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.image, size: 24),
                        ),
                      )
                    : const Text('-'),
              ),
              DataCell(
                PopupMenuButton<String>(
                  onSelected: (v) {
                    // TODO: Detail/Edit/Hapus
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: 'detail', child: Text('Detail')),
                    PopupMenuItem(value: 'edit', child: Text('Edit')),
                    PopupMenuItem(value: 'hapus', child: Text('Hapus')),
                  ],
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
