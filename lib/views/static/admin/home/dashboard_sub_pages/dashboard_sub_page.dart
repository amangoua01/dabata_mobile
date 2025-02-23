import 'package:dabata_mobile/views/static/home/user/user_profile.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:dabata_mobile/tools/components/c_card.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/views/static/admin/home/edtion_user_page.dart';
import 'package:dabata_mobile/views/static/home/user/payer_ma_cotisation.dart';
import 'package:dabata_mobile/views/controllers/admin/dashboard_sub_page_vctl.dart';
import 'package:dabata_mobile/views/static/admin/categories/edition_categorie_page.dart';
import 'package:dabata_mobile/views/static/admin/carte_souscription/edition_carte_souscription_page.dart';

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
              title: const Text("Admin Dashboard"),
              actions: [
                IconButton(
                    icon: const Icon(Icons.notifications, size: 30),
                    onPressed: () {})
              ]),
          body: ListView(
            children: const [
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CCard(
                    amount: 50,
                    title: "Inscrit(e)",
                    unite: "Pers.",
                  ),
                  CCard(
                    amount: 3000000,
                    title: "Cotisation cumulée",
                  ),
                ],
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CCard(
                    amount: 5000000,
                    title: "Rest à cotiser",
                  ),
                  CCard(
                    amount: 5000000,
                    title: "Nb. cartes",
                  ),
                ],
              )
            ],
          ),
          floatingActionButton: SpeedDial(
            spacing: 3,
            backgroundColor: AppColors.primary,
            children: [
              SpeedDialChild(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                label: "Ajouter une catégorie",
                child: const Icon(Icons.add, color: Colors.white),
                onTap: () => Get.to(() => const EditionCategoriePage()),
              ),
              SpeedDialChild(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                label: "Ajouter une carte",
                child: Image.asset(
                  "assets/icons/add_card.png",
                  height: 30,
                  color: Colors.white,
                ),
                onTap: () => Get.to(() => const EditionCarteSouscriptionPage()),
              ),
              SpeedDialChild(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                label: "Ajouter un utilisateur",
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onTap: () => Get.to(() => const EdtionUserPage()),
              ),
              SpeedDialChild(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                label: "Ajouter un paiement",
                child: Image.asset("assets/icons/payer.png",
                    height: 30, color: Colors.white),
                onTap: () => Get.to(() => const PayerMaCotisation()),
              ),
            ],
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
