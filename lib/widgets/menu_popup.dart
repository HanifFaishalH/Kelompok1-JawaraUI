import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MenuPopUp extends StatefulWidget {
  final VoidCallback onClose;

  const MenuPopUp({super.key, required this.onClose});

  @override
  State<MenuPopUp> createState() => _MenuPopUpState();
}

class _MenuPopUpState extends State<MenuPopUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  final listMenu = [
    {'icon': FontAwesomeIcons.chartPie, 'label': 'Dashboard'},
    {'icon': FontAwesomeIcons.wallet, 'label': 'Keuangan'},
    {'icon': FontAwesomeIcons.calendarDays, 'label': 'Kegiatan'},
    {'icon': FontAwesomeIcons.idCard, 'label': 'Kependudukan'},
    {
      'icon': FontAwesomeIcons.houseUser,
      'label': 'Data Warga & Rumah',
      'route': '/dataWargadanRumah'
    },
    {'icon': FontAwesomeIcons.moneyBillTransfer, 'label': 'Pemasukan'},
    {'icon': FontAwesomeIcons.moneyBillTrendUp, 'label': 'Pengeluaran'},
    {'icon': FontAwesomeIcons.fileInvoiceDollar, 'label': 'Laporan Keuangan'},
    {'icon': FontAwesomeIcons.solidCalendarCheck, 'label': 'Kegiatan & Broadcast'},
    {'icon': FontAwesomeIcons.solidMessage, 'label': 'Pesan Warga'},
    {'icon': FontAwesomeIcons.personCircleCheck, 'label': 'Penerimaan Warga'},
    {'icon': FontAwesomeIcons.peopleArrows, 'label': 'Mutasi Keluarga'},
    {'icon': FontAwesomeIcons.clockRotateLeft, 'label': 'Log Aktivitas'},
    {'icon': FontAwesomeIcons.usersGear, 'label': 'Manajemen Pengguna'},
    {'icon': FontAwesomeIcons.rightLeft, 'label': 'Channel Transfer'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // mulai dari bawah
      end: const Offset(0, 0),   // ke posisi normal
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        // Background transparan untuk menutup popup
        GestureDetector(
          onTap: () {
            _controller.reverse().then((_) => widget.onClose());
          },
          child: Container(
            color: Colors.black.withOpacity(0.25),
          ),
        ),

        // Menu muncul dari belakang bottom navbar
        Positioned(
          left: 0,
          right: 0,
          bottom: 70, // posisinya pas di belakang bottom navbar
          child: SlideTransition(
            position: _offsetAnimation,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listMenu.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final menu = listMenu[index];
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          _controller.reverse().then((_) => widget.onClose());

                          final route = menu['route'] as String?;
                          if (route != null && route.isNotEmpty) {
                            context.go(route);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              menu['icon'] as IconData,
                              color: colorScheme.primary,
                              size: 28,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              menu['label'] as String,
                              style: TextStyle(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
