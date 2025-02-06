import 'package:custom_linear_progress_indicator/custom_linear_progress_indicator.dart';
import 'package:dabata_mobile/tools/components/progress_bar.dart';
import 'package:dabata_mobile/views/static/auth/register_sub_page.dart';
import 'package:dabata_mobile/views/static/home/user/changer_carte.dart';
import 'package:dabata_mobile/views/static/home/user/payer_ma_cotisation.dart';
import 'package:dabata_mobile/views/static/home/user/voir_mes_cotisations.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:get/get.dart';

class UserCardInfoSubPage extends StatelessWidget {
  final Carte carte;
  const UserCardInfoSubPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    late double progressPercent = carte.montantJournalier.value / 73000 * 100;
    print('% $progressPercent');
    print(carte.montantJournalier.value * 365);
    return SafeArea(
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Image.network(
              carte.image.value,
              height: 200,
            ),
          ),
          ListTile(
            title: Text(carte.libelle.value),
            subtitle: Text(carte.categorie!.libelle.value),
            trailing: Text(carte.montantJournalier.toAmount()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Payé",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Gap(5),
                ProgressBar(
                  value: progressPercent,
                ),
              ],
            ),
          ),
          const Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("Reste"),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CButton(
                      onPressed: () => Get.to(() => const VoirMesCotisations()),
                      child: const Text("Voir mes cotisations")),
                ),
              )
            ],
          ),
          ListTile(
            title: const Text("Montant journalier"),
            trailing: Text(carte.montantJournalier.toAmount()),
          ),
          ListTile(
            title: const Text("Date de debut"),
            trailing: Text(carte.debut.value),
          ),
          ListTile(
            title: const Text("Date de fin"),
            trailing: Text(carte.fin.value),
          ),
          ListTile(
            title: const Text("Total"),
            trailing: Text(carte.montantJournalier.toAmount()),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CButton(
                      onPressed: () {},
                      child: const Text("Ajouter une date de livraison")),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CButton(
                      onPressed: () => Get.to(() => const PayerMaCotisation()),
                      child: const Text("Payer ma cotisation")),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CButton(
                      onPressed: () => Get.to(() => const ChangerCarte()),
                      child: const Text("Changer de carte")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
