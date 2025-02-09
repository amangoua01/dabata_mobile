import 'package:dabata_mobile/tools/components/c_card.dart';
import 'package:dabata_mobile/tools/components/card_suscribe.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/dashboard_vctl.dart';
import 'package:dabata_mobile/views/static/home/User/user_profile.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardVctl>(
      init: DashboardVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Get.to(() => const UserProfile()),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    "assets/icons/user2.png",
                  ),
                ),
              ),
            ),
            centerTitle: true,
            title: const Text("Accueil"),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(children: [
              const Gap(20),
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.9,
                ),
                shrinkWrap: true,
                children: const [
                  CCard(title: "Montant cotisé", amount: 1000000),
                  CCard(title: "Montant restant", amount: 15000),
                ],
              ),
              const Gap(20),
              const Row(
                children: [
                  Text(
                    "Mes cartes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Gap(10),
                  Expanded(child: Divider(color: Colors.black)),
                ],
              ),
              const Gap(10),
              Column(
                children: ctl.cartes
                    .map(
                      (e) => CardSuscribe(e),
                    )
                    .toList(),
              ),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primary,
            child: const Icon(Icons.add),
            onPressed: () => Get.to(() => const CardListePage()),
          ),
        );
      },
    );
  }
}
