import 'package:dabata_mobile/views/controllers/home/dashboard/dashboard_vctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardVctl>(
      init: DashboardVctl(),
      builder: (ctl) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: ctl.currentPage,
              onTap: (e) {
                ctl.currentPage = e;
                ctl.update();
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard, size: 30),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/historique.png",
                    width: 30,
                  ),
                  activeIcon: Image.asset(
                    "assets/images/historique.png",
                    width: 30,
                    color: Colors.orange,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/gains.png",
                    width: 30,
                  ),
                  activeIcon: Image.asset(
                    "assets/images/gains.png",
                    width: 30,
                    color: Colors.orange,
                  ),
                  label: "",
                ),
              ]),
          body: ctl.pages.elementAt(ctl.currentPage),
        );
      },
    );
  }
}
