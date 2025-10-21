import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:jawaramobile_1/widgets/manajemen_pengguna_filter.dart';
import 'package:go_router/go_router.dart';

class DaftarPenggunaScreen extends StatefulWidget {
  const DaftarPenggunaScreen({super.key});
  @override
  State<DaftarPenggunaScreen> createState() => _DaftarPenggunaScreenState();
}

class _DaftarPenggunaScreenState extends State<DaftarPenggunaScreen> {
  // Dummy data mirip tabel web (NO, NAMA, EMAIL, STATUS REGISTRASI)
  final List<Map<String, String>> _users = [
    {"no":"1","nama":"mimin","email":"mimin@gmail.com","status":"Diterima"},
    {"no":"2","nama":"Farhan","email":"farhan@gmail.com","status":"Diterima"},
    {"no":"3","nama":"dewqedwddw","email":"admiwewen1@gmail.com","status":"Diterima"},
    {"no":"4","nama":"Rendha Putra Rahmadya","email":"rendhazuper@gmail.com","status":"Diterima"},
    {"no":"5","nama":"bla","email":"y@gmail.com","status":"Diterima"},
    {"no":"6","nama":"Anti Micin","email":"antimicin3@gmail.com","status":"Diterima"},
  ];

  // state filter (sederhana)
  String? _queryNama;
  String? _queryStatus;

  List<Map<String, String>> get _filtered {
    return _users.where((u) {
      final okNama = _queryNama == null || _queryNama!.isEmpty
          ? true
          : (u['nama']!.toLowerCase().contains(_queryNama!.toLowerCase()));
      final okStatus = _queryStatus == null || _queryStatus!.isEmpty
          ? true
          : (u['status'] == _queryStatus);
      return okNama && okStatus;
    }).toList();
  }

  void _openFilter() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Filter Manajemen Pengguna"),
        content: const ManajemenPenggunaFilter(),
        actions: [
          OutlinedButton(
            onPressed: () {
              setState(() {
                _queryNama = null;
                _queryStatus = null;
              });
              Navigator.of(context).pop();
            },
            child: const Text("Reset Filter"),
          ),
          ElevatedButton(
            onPressed: () {
              // ambil dari widget via context.find? lebih simpel: pakai GlobalKey atau temp stateful builder
              // Untuk ringkas, kita reopen dialog sebagai StatefulBuilder:
              Navigator.of(context).pop();
              // (implementasikan sesuai kebutuhan mu, contoh ini reset/no-op)
            },
            child: const Text("Terapkan"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rows = _filtered;

    Color statusBg(String s) {
      switch (s) {
        case 'Diterima': return Colors.green.withOpacity(.12);
        case 'Pending':  return Colors.orange.withOpacity(.12);
        case 'Ditolak':  return Colors.red.withOpacity(.12);
        default: return Colors.grey.withOpacity(.12);
      }
    }
    Color statusFg(String s) {
      switch (s) {
        case 'Diterima': return Colors.green.shade800;
        case 'Pending':  return Colors.orange.shade800;
        case 'Ditolak':  return Colors.red.shade800;
        default: return Colors.grey.shade800;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Daftar Pengguna",
          style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onPrimary),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: _openFilter),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.of(context).pushNamed('/tambah-pengguna'),
        onPressed: () => context.push('/tambah-pengguna'),
        child: const Icon(Icons.person_add_alt_1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 700,
          columns: const [
            DataColumn2(label: Text('No'), size: ColumnSize.S),
            DataColumn2(label: Text('Nama'), size: ColumnSize.L),
            DataColumn2(label: Text('Email'), size: ColumnSize.L),
            DataColumn2(label: Text('Status Registrasi'), size: ColumnSize.M),
            DataColumn2(label: Center(child: Text('Aksi')), size: ColumnSize.S),
          ],
          rows: rows.map((u) {
            return DataRow(cells: [
              DataCell(Text(u['no']!)),
              DataCell(Text(u['nama']!)),
              DataCell(Text(u['email']!)),
              DataCell(
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusBg(u['status']!),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(u['status']!, style: TextStyle(fontWeight: FontWeight.w600, color: statusFg(u['status']!))),
                ),
              ),
              DataCell(
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_horiz, color: theme.colorScheme.primary),
                  onSelected: (v) {
                    // TODO: detail/edit/hapus sesuai kebutuhan
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
