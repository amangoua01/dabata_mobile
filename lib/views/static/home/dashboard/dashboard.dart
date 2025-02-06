import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/tools/components/c_card.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/components/card_suscribe.dart';
import 'package:dabata_mobile/views/static/home/User/user_profile.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:dabata_mobile/views/static/home/user/user_card_detail_page.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/dashboard_vctl.dart';

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
                  child:
                      CircleAvatar(backgroundImage: NetworkImage(ctl.image))),
            ),
            centerTitle: true,
            title: const Text("Accueil"),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(children: [
              const Gap(20),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CCard(title: "Montant cotisé", amount: 1000000),
                    CCard(title: "Montant restant", amount: 15000),
                  ]),
              const Gap(20),
              const Text("Mes cartes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              const Gap(10),
              Column(
                children: ctl.cartes
                    .map(
                      (e) => GestureDetector(
                        onTap: () => Get.to(() => UserCardDetailPage(e)),
                        child: CardSuscribe(
                          title: e.libelle.value,
                          amount: e.montantJournalier,
                          image: e.image.value,
                          category: e.categorie!.libelle.value,
                        ),
                      ),
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
