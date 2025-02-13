import 'package:dabata_mobile/tools/components/c_card.dart';
import 'package:dabata_mobile/tools/components/card_suscribe.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/custom_tab_bar.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/dashboard_vctl.dart';
import 'package:dabata_mobile/views/static/home/User/user_profile.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
            body: CustomTabBar(
              tabs: const [
                Tab(text: "En cours"),
                Tab(text: "Soldés"),
                Tab(text: "Toutes"),
              ],
              controller: ctl.controller,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(children: [
                    const Gap(20),
                    GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.9,
                      ),
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // Empêche le défilement du GridView
                      children: [
                        const CCard(title: "Montant cotisé", amount: 1000000)
                            .animate()
                            .flipH(
                              delay: 500.ms,
                              duration: 500.ms,
                              curve: Curves.easeInOut,
                            ),
                        const CCard(title: "Montant restant", amount: 15000)
                            .animate()
                            .flip(
                              delay: 600.ms,
                              duration: 600.ms,
                              curve: Curves.easeInOut,
                            )
                      ],
                    ),
                    const Gap(20),
                    const Row(children: [
                      Text(
                        "Mes cartes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Gap(10),
                      Expanded(child: Divider(color: Colors.black)),
                    ]).animate().flip(
                          duration: 700.ms,
                          delay: 700.ms,
                          curve: Curves.easeInOutQuart,
                        ),
                    const Gap(10),
                    Column(
                      children: [
                        ...ctl.cartes.map(
                          (e) => CardSuscribe(e),
                        )
                        //.toList()
                      ]
                          .animate(interval: 500.ms)
                          .slideX(delay: NumDurationExtensions(1).seconds)
                          .fade(),
                    )
                  ]
                      /* .animate(interval: 300.ms)
                        .slideX(delay: NumDurationExtensions(1).seconds)
                        .fade(), */
                      //.animate(interval: 500.ms).fade(duration: 600.ms),
                      ),
                ),
                const Center(child: Text("Soldés")),
                const Center(child: Text("Toutes")),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.add),
              onPressed: () => Get.to(() => const CardListePage()),
            ).animate().slideX(delay: NumDurationExtensions(3).seconds));
      },
    );
  }
}
