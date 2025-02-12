import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:dabata_mobile/views/controllers/home/home_vctl.dart';
import 'package:dabata_mobile/tools/components/navigation_bottom_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVctl>(
        init: HomeVctl(),
        builder: (ctl) {
          return Scaffold(
            body: ctl.pageList[ctl.selectedIndex],
            bottomNavigationBar: NavigationBottomBar(
              currentIndex: ctl.selectedIndex,
              onTap: ctl.onTabChange,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Accueil',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/historique.png',
                    height: 20,
                    color: ctl.selectedIndex == 1
                        ? AppColors.primary
                        : Colors.grey,
                  ),
                  label: 'Historique',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/gains.png',
                    height: 20,
                    color: ctl.selectedIndex == 2
                        ? AppColors.primary
                        : Colors.grey,
                  ),
                  label: 'Gains',
                ),
              ],
            ),
          );
        });
  }
}
