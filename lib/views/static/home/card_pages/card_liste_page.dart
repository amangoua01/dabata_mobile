import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/card_item.dart';
import 'package:dabata_mobile/views/controllers/home/card_liste_page_vctl.dart';
import 'package:dabata_mobile/views/static/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardListePage extends StatelessWidget {
  const CardListePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CardListePageVctl(),
      builder: (ctl) {
        return DefaultTabController(
          length: ctl.uniqueCategories.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Cartes disponibles"),
              actions: [
                IconButton(
                  onPressed: () => Get.to(() => const AuthPage()),
                  icon: const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/icons/user2.png"),
                  ),
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: ctl.uniqueCategories
                    .map((cat) => Tab(text: cat.libelle))
                    .toList(),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade600,
                ),
                indicatorWeight: 0,
                padding: const EdgeInsets.all(2),
                indicator: const BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                onTap: (i) {
                  ctl.selectedCategorieId = ctl.uniqueCategories[i].id;
                  ctl.update();
                },
              ),
            ),
            body: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: .7,
              ),
              itemCount: ctl.cartes.length,
              itemBuilder: (context, index) {
                return CardItem(ctl.cartes[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
