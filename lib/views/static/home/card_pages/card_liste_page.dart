import 'package:dabata_mobile/tools/widgets/card_item.dart';
import 'package:dabata_mobile/tools/widgets/custom_tab_bar.dart';
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
            ),
            body: CustomTabBar(
              controller: ctl.controller,
              tabs: ctl.uniqueCategories
                  .map((cat) => Tab(text: cat.libelle))
                  .toList(),
              children: ctl.uniqueCategories
                  .map((category) => GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: .7,
                        ),
                        itemCount: ctl.loadedCartes
                            .where(
                                (carte) => carte.categorie?.id == category.id)
                            .length,
                        itemBuilder: (context, index) {
                          final filteredCartes = ctl.loadedCartes
                              .where(
                                  (carte) => carte.categorie?.id == category.id)
                              .toList();
                          return CardItem(filteredCartes[index]);
                        },
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
