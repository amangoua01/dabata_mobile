import 'package:dabata_mobile/tools/widgets/card_item.dart';
import 'package:dabata_mobile/tools/widgets/custom_tab_bar.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:dabata_mobile/views/controllers/home/card_liste_page_vctl.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';
import 'package:dabata_mobile/views/static/auth/auth_page.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_list_page_shimmer.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardListePage extends StatelessWidget {
  final bool withProfil;
  const CardListePage({this.withProfil = true, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardListePageVctl>(
      init: CardListePageVctl(),
      builder: (ctl) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            title: const Text("Cartes disponibles"),
            actions: [
              Visibility(
                visible: withProfil,
                child: IconButton(
                  onPressed: () {
                    if (ctl.authUser != null) {
                      if (ctl.user?.isAdmin == true) {
                        Get.to(() => const AdminDashboard());
                      } else {
                        Get.to(() => const Dashboard());
                      }
                    } else {
                      Get.to(() => const AuthPage());
                    }
                  },
                  icon: const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/icons/user2.png"),
                  ),
                ),
              ),
            ],
          ),
          body: ctl.isLoading
              ? const Center(child: CardListePageShimmer())
              : CustomTabBar(
                  color: Colors.white,
                  controller: ctl.controller,
                  tabs: ctl.uniqueCategories
                      .map((cat) => Tab(text: cat.libelle))
                      .toList(),
                  children: ctl.uniqueCategories
                      .map(
                        (category) => ctl.card
                                .where((carte) =>
                                    carte.categorie?.id == category.id)
                                .isEmpty
                            ? const WrapperBodyListView(
                                loading: false,
                                children: [],
                              )
                            : GridView.builder(
                                padding: const EdgeInsets.all(10),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: .7,
                                ),
                                itemCount: ctl.card
                                    .where((carte) =>
                                        carte.categorie?.id == category.id)
                                    .length,
                                itemBuilder: (context, index) {
                                  final filteredCartes = ctl.card
                                      .where((carte) =>
                                          carte.categorie?.id == category.id)
                                      .toList();
                                  return CardItem(filteredCartes[index]);
                                },
                              ),
                      )
                      .toList(),
                ),
        );
      },
    );
  }
}
