import 'package:dabata_mobile/tools/components/navigation_bottom_bar.dart';
import 'package:dabata_mobile/views/controllers/admin/admin_dashboard_vctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminDashboardVctl>(
        init: AdminDashboardVctl(),
        builder: (ctl) {
          return Scaffold(
            body: ctl.pages[ctl.selectedIndex],
            bottomNavigationBar: NavigationBottomBar(
              currentIndex: ctl.selectedIndex,
              onTap: ctl.changePage,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Utilisateurs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Paramètres',
                ),
              ],
            ),
          );
        });
  }
}
