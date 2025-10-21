import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'mutasi_detail_page.dart';

class MutasiPage extends StatelessWidget {
  final List<Map<String, dynamic>> dataMutasi = [
    {
      "no": 1,
      "tanggal": "15 Oktober 2025",
      "keluarga": "Keluarga Ijat",
      "jenis": "Keluar Wilayah",
      "alasan": "Karena mau keluar",
      "alamatLama": "i",
      "alamatBaru": "-",
    },
    {
      "no": 2,
      "tanggal": "30 September 2025",
      "keluarga": "Keluarga Mara Nunez",
      "jenis": "Pindah Rumah",
      "alasan": "Pindah ke rumah baru",
      "alamatLama": "Jl. Kenangan No. 5",
      "alamatBaru": "Jl. Damai No. 9",
    },
    {
      "no": 3,
      "tanggal": "24 Oktober 2026",
      "keluarga": "Keluarga Ijat",
      "jenis": "Pindah Rumah",
      "alasan": "Dekat tempat kerja",
      "alamatLama": "Jl. Raya",
      "alamatBaru": "Jl. Baru",
    },
  ];

  Color _getChipColor(String jenis) {
    if (jenis == "Keluar Wilayah") return Colors.red.shade100;
    return Colors.green.shade100;
  }

  Color _getTextColor(String jenis) {
    if (jenis == "Keluar Wilayah") return Colors.red.shade800;
    return Colors.green.shade800;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Mutasi Warga"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(Colors.grey.shade200),
          columns: const [
            DataColumn(label: Text("NO")),
            DataColumn(label: Text("TANGGAL")),
            DataColumn(label: Text("KELUARGA")),
            DataColumn(label: Text("JENIS MUTASI")),
            DataColumn(label: Text("AKSI")),
          ],
          rows: dataMutasi.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item['no'].toString())),
                DataCell(Text(item['tanggal'])),
                DataCell(Text(item['keluarga'])),
                DataCell(
                  Container(
                    decoration: BoxDecoration(
                      color: _getChipColor(item['jenis']),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      item['jenis'],
                      style: TextStyle(color: _getTextColor(item['jenis'])),
                    ),
                  ),
                ),
                DataCell(
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {
                      context.pushNamed(
                        'mutasi-detail',
                        extra: item
                      );
                    },
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
