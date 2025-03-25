import 'package:dabata_mobile/tools/alert_widgets/c_choice_message_dialog.dart';
import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/constants/env.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:dabata_mobile/views/static/home/dashboard/gains_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsSubPage extends StatelessWidget {
  const SettingsSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            height: 200,
            width: double.infinity,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary,
                  child: Image.asset(
                    "assets/images/Logo_Dabata.png",
                    height: 80,
                  ),
                ),
                const ListTile(
                  title: Text("Dabata", textAlign: TextAlign.center),
                  subtitle: Text(
                    "Admin | ${Env.appVersion}",
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primary.shade100,
              child: Image.asset(
                "assets/icons/gains.png",
                height: 40,
              ),
            ),
            title: const Text("Gains cumulés"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            onTap: () => Get.to(() => const GainsSubPage()),
          ),
          // ListTile(
          //   leading: CircleAvatar(
          //     backgroundColor: AppColors.primary.shade100,
          //     child: Image.asset(
          //       "assets/icons/categories.png",
          //       height: 40,
          //     ),
          //   ),
          //   title: const Text("Catégories"),
          //   trailing: const Icon(Icons.arrow_forward_ios, size: 20),
          //   onTap: () => Get.to(() => const CategorieListePage()),
          // ),
          // ListTile(
          //   leading: CircleAvatar(
          //     backgroundColor: AppColors.primary.shade100,
          //     child: Image.asset(
          //       "assets/icons/cadeau.png",
          //       height: 30,
          //     ),
          //   ),
          //   title: const Text("Articles"),
          //   trailing: const Icon(Icons.arrow_forward_ios, size: 20),
          //   onTap: () => Get.to(() => const ArticleListePage()),
          // ),
          // ListTile(
          //   leading: CircleAvatar(
          //     backgroundColor: AppColors.primary.shade100,
          //     child: Image.asset(
          //       "assets/icons/paiements.png",
          //       height: 30,
          //     ),
          //   ),
          //   title: const Text("Modes de paiement"),
          //   trailing: const Icon(Icons.arrow_forward_ios, size: 20),
          //   onTap: () => Get.to(() => const ModePaiementListePage()),
          // ),
          // ListTile(
          //   leading: CircleAvatar(
          //     backgroundColor: AppColors.primary.shade100,
          //     child: Image.asset("assets/icons/carte.png", height: 30),
          //   ),
          //   title: const Text("Cartes de souscription"),
          //   trailing: const Icon(Icons.arrow_forward_ios, size: 20),
          //   onTap: () => Get.to(() => const CarteSouscriptionListePage()),
          // ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primary.shade100,
              child: Image.asset(
                "assets/icons/logout.png",
                height: 30,
              ),
            ),
            title: const Text("Logout"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            onTap: () {
              CChoiceMessageDialog.show(
                message: "Voulez-vous vraiment vous déconnecter?",
              ).then((confirmed) {
                if (confirmed == true) {
                  Cache.clear();
                  WebConst.jwt = "";
                  Get.deleteAll(force: true);
                  Get.offAll(() => const CardListePage());
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
