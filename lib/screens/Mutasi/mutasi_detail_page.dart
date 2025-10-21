import 'package:flutter/material.dart';

class MutasiDetailPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const MutasiDetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Mutasi Warga"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Detail Mutasi Warga",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildDetail("Keluarga", data['keluarga']),
            _buildDetail("Alamat Lama", data['alamatLama']),
            _buildDetail("Alamat Baru", data['alamatBaru']),
            _buildDetail("Tanggal Mutasi", data['tanggal']),
            _buildDetail("Jenis Mutasi", data['jenis']),
            _buildDetail("Alasan", data['alasan']),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label:",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
