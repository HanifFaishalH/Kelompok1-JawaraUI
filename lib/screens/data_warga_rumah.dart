import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:jawaramobile_1/widgets/button.dart'; // pastikan path sesuai

class DataWargaPage extends StatefulWidget {
  const DataWargaPage({super.key});

  @override
  State<DataWargaPage> createState() => _DataWargaPageState();
}

class _DataWargaPageState extends State<DataWargaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> warga = [
    {"nama": "Hanif", "nik": "1234567890123456", "umur": 22, "pekerjaan": "Mahasiswa"},
    {"nama": "Siti", "nik": "1234567890123457", "umur": 25, "pekerjaan": "Guru"},
  ];

  final List<Map<String, dynamic>> rumah = [
    {"alamat": "Jl. Melati No.10", "luas": "120 m²", "status": "Milik Sendiri"},
    {"alamat": "Jl. Mawar No.7", "luas": "90 m²", "status": "Kontrak"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // ========== Tombol Kembali ==========
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomButton(
                  icon: Icons.arrow_back,
                  text: "Kembali ke Dashboard",
                  isOutlined: true,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            // ========== TabBar ==========
            Container(
              color: colorScheme.primary,
              child: TabBar(
                controller: _tabController,
                indicatorColor: colorScheme.onPrimary,
                labelColor: colorScheme.onPrimary,
                unselectedLabelColor: colorScheme.onPrimary.withOpacity(0.7),
                tabs: const [
                  Tab(text: "Data Warga"),
                  Tab(text: "Keluarga"),
                  Tab(text: "Data Rumah"),
                ],
              ),
            ),

            // ========== Isi Halaman per Tab ==========
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildDataWarga(theme, colorScheme),
                  _buildKeluarga(theme),
                  _buildDataRumah(theme, colorScheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= TAB 1 =================
  Widget _buildDataWarga(ThemeData theme, ColorScheme colorScheme) {
    final _formKey = GlobalKey<FormState>();
    final nama = TextEditingController();
    final nik = TextEditingController();
    final umur = TextEditingController();
    final pekerjaan = TextEditingController();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Form Data Warga",
                      style: theme.textTheme.titleLarge?.copyWith(color: colorScheme.primary)),
                  const SizedBox(height: 12),
                  _buildTextField(nama, "Nama Lengkap", theme),
                  _buildTextField(nik, "NIK", theme, keyboardType: TextInputType.number),
                  _buildTextField(umur, "Umur", theme, keyboardType: TextInputType.number),
                  _buildTextField(pekerjaan, "Pekerjaan", theme),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      icon: Icons.save,
                      text: "Simpan",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            warga.add({
                              "nama": nama.text,
                              "nik": nik.text,
                              "umur": int.tryParse(umur.text) ?? 0,
                              "pekerjaan": pekerjaan.text,
                            });
                          });
                          nama.clear();
                          nik.clear();
                          umur.clear();
                          pekerjaan.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        Text("Tabel Data Warga",
            style: theme.textTheme.titleLarge?.copyWith(color: colorScheme.primary)),
        const SizedBox(height: 8),
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 400,
            headingRowColor: WidgetStateProperty.all(colorScheme.primaryContainer),
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
      ],
    );
  }

  // ================= TAB 2 =================
  Widget _buildKeluarga(ThemeData theme) {
    return Center(
      child: Text(
        "Fitur Data Keluarga — coming soon 👨‍👩‍👧‍👦",
        style: theme.textTheme.titleMedium,
      ),
    );
  }

  // ================= TAB 3 =================
  Widget _buildDataRumah(ThemeData theme, ColorScheme colorScheme) {
    final _formKey = GlobalKey<FormState>();
    final alamat = TextEditingController();
    final luas = TextEditingController();
    final status = TextEditingController();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Form Data Rumah",
                      style: theme.textTheme.titleLarge?.copyWith(color: colorScheme.primary)),
                  const SizedBox(height: 12),
                  _buildTextField(alamat, "Alamat Rumah", theme),
                  _buildTextField(luas, "Luas Rumah", theme),
                  _buildTextField(status, "Status Kepemilikan", theme),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      icon: Icons.save,
                      text: "Simpan",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            rumah.add({
                              "alamat": alamat.text,
                              "luas": luas.text,
                              "status": status.text,
                            });
                          });
                          alamat.clear();
                          luas.clear();
                          status.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        Text("Tabel Data Rumah",
            style: theme.textTheme.titleLarge?.copyWith(color: colorScheme.primary)),
        const SizedBox(height: 8),
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 400,
            headingRowColor: WidgetStateProperty.all(colorScheme.primaryContainer),
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
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, ThemeData theme,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
      ),
    );
  }
}
