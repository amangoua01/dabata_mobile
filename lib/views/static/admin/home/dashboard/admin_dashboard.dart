import 'package:dabata_mobile/tools/components/navigation_bottom_bar.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
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
            onTap: (index) {
              ctl.selectedIndex = index;
              ctl.update();
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/icons/payer.png",
                    height: 30,
                    color: ctl.selectedIndex == 3
                        ? AppColors.primary
                        : Colors.grey.shade500),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
