import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/custom_tab_bar.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/dashboard_sub_page_vctl.dart';
import 'package:dabata_mobile/views/static/home/User/user_profile.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dash_sub_pages/annule_page.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dash_sub_pages/en_cours_page.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dash_sub_pages/solde_page.dart';
import 'package:dabata_mobile/views/static/notifications/list_notif_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardSubPage extends StatelessWidget {
  const DashboardSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardSubPageVctl>(
      init: DashboardSubPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Get.to(() => const UserProfile()),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      "assets/icons/user2.png",
                    ),
                  ),
                ),
              ),
            ),
            centerTitle: true,
            title: const Text("Accueil"),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                  onPressed: () => Get.to(() => const ListNotifPage()),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primary,
            onPressed: ctl.subscribe,
            child: const Icon(Icons.add),
          ),
          body: CustomTabBar(
            color: AppColors.tertiary,
            tabs: const [
              Tab(text: "En cours"),
              Tab(text: "Soldées"),
              Tab(text: "Annulée"),
            ],
            controller: ctl.controller,
            children: [
              EnCoursPage(ctl),
              SoldePage(ctl),
              AnnulePage(ctl),
            ],
          ),
        );
      },
    );
  }
}
