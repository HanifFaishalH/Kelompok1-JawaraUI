import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class TambahKegiatanForm extends StatefulWidget {
  // Tambahkan parameter opsional untuk menerima data awal (untuk mode edit)
  final Map<String, String>? initialData;

  const TambahKegiatanForm({super.key, this.initialData});

  @override
  State<TambahKegiatanForm> createState() => _TambahKegiatanFormState();
}

class _TambahKegiatanFormState extends State<TambahKegiatanForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers untuk setiap field
  late TextEditingController _namaController;
  late TextEditingController _pjController;
  late TextEditingController _tanggalController;
  late TextEditingController _lokasiController;
  late TextEditingController _deskripsiController;
  String? _selectedKategori;
  File? _photo;

  final ImagePicker _imagePicker = ImagePicker();

  final List<String> _kategoriOptions = [
    'Komunitas & Sosial',
    'Kebersihan & Keamanan',
    'Kesehatan & Olahraga',
    'Pendidikan',
    'Lainnya',
  ];

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan data awal jika ada (mode edit)
    final data = widget.initialData;
    _namaController = TextEditingController(text: data?['nama']);
    _pjController = TextEditingController(text: data?['pj']);
    _tanggalController = TextEditingController(text: data?['tanggal']);
    _lokasiController = TextEditingController(text: data?['lokasi']);
    _deskripsiController = TextEditingController(text: data?['deskripsi']);
    _selectedKategori = data?['kategori'];
  }

  @override
  void dispose() {
    _namaController.dispose();
    _pjController.dispose();
    _tanggalController.dispose();
    _lokasiController.dispose();
    _deskripsiController.dispose();
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

  Future<void> _pickImage() async {
    final XFile? pickedImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        _photo = File(pickedImage.path);
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
            controller: _namaController,
            decoration: InputDecoration(
              labelText: 'Nama Kegiatan',
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
          DropdownButtonFormField<String>(
            value: _selectedKategori,
            hint: const Text("Pilih Kategori"),
            decoration: InputDecoration(
              labelText: "Kategori",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: fillColor,
            ),
            items: _kategoriOptions
                .map(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            onChanged: (newValue) =>
                setState(() => _selectedKategori = newValue),
            validator: (value) =>
                value == null ? 'Silakan pilih kategori' : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _pjController,
            decoration: InputDecoration(
              labelText: 'Penanggung Jawab',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: fillColor,
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Penanggung jawab tidak boleh kosong'
                : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _lokasiController,
            decoration: InputDecoration(
              labelText: 'Lokasi',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: fillColor,
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Lokasi tidak boleh kosong'
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
            controller: _deskripsiController,
            decoration: InputDecoration(
              labelText: 'Deskripsi',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: fillColor,
            ),
            maxLines: 4,
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Deskripsi tidak boleh kosong'
                : null,
          ),
          const SizedBox(height: 20),
          Text(
            'Upload Dokumentasi (Opsional)',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          _buildImagePicker(context),
          const SizedBox(height: 20),
          const SizedBox(height: 40),
          ElevatedButton(onPressed: _submitForm, child: const Text('Simpan')),
        ],
      ),
    );
  }

  Widget _buildImagePicker(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          /* ... styling ... */ color: Colors.grey.shade100,
        ),
        child: _photo == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.add_a_photo_outlined),
                    Text('Tap untuk tambah foto'),
                  ],
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  _photo!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
      ),
    );
  }
}
