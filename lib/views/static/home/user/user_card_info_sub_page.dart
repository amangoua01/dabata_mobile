import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/tools/components/progress_bar.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/views/static/home/user/voir_mes_cotisations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserCardInfoSubPage extends StatelessWidget {
  final Souscription souscription;
  const UserCardInfoSubPage(this.souscription, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              souscription.carte!.image,
              height: 200,
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            title: Text(
              souscription.carte!.libelle.defaultValue("n/a"),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
              ),
            ),
            subtitle: Text(souscription.carte!.categorie?.libelle ?? ""),
            trailing: Text(
              souscription.carte!.montantTotal.toAmount(devise: "F"),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payé : ${souscription.tauxCotisation.toAmount(devise: "F")}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Gap(8),
                ProgressBar(value: souscription.tauxCotisation),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Reste : ${souscription.montantRestant.toAmount(devise: "F")}",
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CButton(
                    onPressed: () => Get.to(() => const VoirMesCotisations()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/calendrier.png",
                          width: 30,
                        ),
                        const Gap(10),
                        const Text("Voir les paiements"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const Gap(20),
          ListTile(
            leading: Image.asset(
              "assets/icons/cadeau.png",
              width: 23,
            ),
            title: const Text(
              "Montant journalier",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            trailing: Text(
              souscription.carte!.montantJournalier != null
                  ? souscription.carte!.montantJournalier!.toAmount(devise: "F")
                  : "0 F",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            horizontalTitleGap: 0,
          ),
          ListTile(
            leading: Image.asset(
              "assets/icons/calendar.png",
              width: 23,
            ),
            horizontalTitleGap: 0,
            title: const Text(
              "Date de debut",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            trailing: Text(
              souscription.carte!.debut != null
                  ? souscription.carte!.debut!.toFrenchDate
                  : "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/icons/calendar.png",
              width: 23,
            ),
            title: const Text(
              "Date de fin",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            horizontalTitleGap: 0,
            trailing: Text(
              souscription.carte!.fin != null
                  ? souscription.carte!.fin!.toFrenchDate
                  : "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/icons/calendar.png",
              width: 23,
            ),
            horizontalTitleGap: 0,
            title: const Text(
              "Date de livraison",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            //subtitle: const Text("Cliquer pour modifier la date"),
            trailing: Text(
              "2025-01-01".toFrenchDate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/icons/map.png",
              width: 23,
            ),
            horizontalTitleGap: 0,
            title: const Text(
              "Lieu de livraison",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            //subtitle: const Text("Cliquer pour modifier le lieu"),
            trailing: const Text(
              "DRCFA",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            horizontalTitleGap: 0,
            title: const Text(
              "Total",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            trailing: Text(
              souscription.carte!.montantTotal!.toAmount(devise: "F"),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
