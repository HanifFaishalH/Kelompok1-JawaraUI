import 'package:flutter/material.dart';
import 'package:jawaramobile_1/widgets/button.dart';
import './DataWargaRumah/tabel_keluarga.dart';
import './DataWargaRumah/tabel_rumah.dart';
import './DataWargaRumah/tabel_warga.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataWargaPage extends StatefulWidget {
  const DataWargaPage({super.key});

  @override
  State<DataWargaPage> createState() => _DataWargaPageState();
}

class _DataWargaPageState extends State<DataWargaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CustomButton(
                    text: "Kembali",
                    icon: FontAwesomeIcons.arrowLeft,
                    color: colorScheme.primary,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),

            // ================= TAB BAR =================
            Container(
              color: colorScheme.primaryContainer,
              child: TabBar(
                controller: _tabController,
                indicatorColor: colorScheme.primary,
                labelColor: colorScheme.primary,
                unselectedLabelColor: colorScheme.onSurface.withOpacity(0.6),
                tabs: const [
                  Tab(text: "Data Warga"),
                  Tab(text: "Keluarga"),
                  Tab(text: "Data Rumah"),
                ],
              ),
            ),

            // ================= ISI TAB =================
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  TabelWarga(),
                  TabelKeluarga(),
                  TabelRumah(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
