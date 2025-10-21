import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TambahBroadcastForm extends StatefulWidget {
  // Tambahkan parameter opsional untuk menerima data awal (untuk mode edit)
  final Map<String, String>? initialData;

  const TambahBroadcastForm({super.key, this.initialData});

  @override
  State<TambahBroadcastForm> createState() => _TambahBroadcastFormState();
}

class _TambahBroadcastFormState extends State<TambahBroadcastForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers untuk setiap field
  late TextEditingController _judulBroadcast;
  late TextEditingController _isiBroadcast;
  late TextEditingController _tanggalController;
  late TextEditingController _pengirim;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan data awal jika ada (mode edit)
    final data = widget.initialData;
    _judulBroadcast = TextEditingController(text: data?['judul']);
    _isiBroadcast = TextEditingController(text: data?['isi']);
    _tanggalController = TextEditingController(text: data?['tanggal']);
    _pengirim = TextEditingController(text: data?['pengirim']);
  }

  @override
  void dispose() {
    _judulBroadcast.dispose();
    _tanggalController.dispose();
    _pengirim.dispose();
    _isiBroadcast.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      String formattedDate = DateFormat('dd MMM yyyy').format(picked);
      setState(() {
        _tanggalController.text = formattedDate;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Menyimpan data kegiatan...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fillColor = theme.colorScheme.primary.withOpacity(0.05);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _judulBroadcast,
            decoration: InputDecoration(
              labelText: 'Judul Broadcast',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: fillColor,
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Nama kegiatan tidak boleh kosong'
                : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _isiBroadcast,
            decoration: InputDecoration(
              labelText: 'Pengirim',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: fillColor,
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Pengirim tidak boleh kosong'
                : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _tanggalController,
            decoration: InputDecoration(
              labelText: 'Tanggal Pelaksanaan',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: const Icon(Icons.calendar_today_outlined),
              filled: true,
              fillColor: fillColor,
            ),
            readOnly: true,
            onTap: () => _selectDate(context),
            validator: (value) =>
                value == null || value.isEmpty ? 'Tanggal harus diisi' : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _isiBroadcast,
            decoration: InputDecoration(
              labelText: 'Isi Broadcast',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: fillColor,
            ),
            maxLines: 4,
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Isi broadcast tidak boleh kosong'
                : null,
          ),
          const SizedBox(height: 40),
          ElevatedButton(onPressed: _submitForm, child: const Text('Simpan')),
        ],
      ),
    );
  }
}
