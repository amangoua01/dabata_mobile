import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/views/controllers/home/card_info_sub_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CardInfoSubPage extends StatelessWidget {
  final Carte carte;
  const CardInfoSubPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardInfoSubPageVctl>(
      init: CardInfoSubPageVctl(),
      builder: (ctl) {
        return ListView(
          padding: const EdgeInsets.only(bottom: 50),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              margin: const EdgeInsets.all(5),
              child: Image.asset(
                carte.image.value,
                height: 200,
              ),
            ),
            ListTile(
              title: Text(carte.libelle.value),
              subtitle: Text(carte.categorie!.libelle.value),
              trailing: Text(carte.montantJournalier!.toAmount(devise: "F")),
            ),
            ListTile(
              leading: Image.asset("assets/icons/montant.png", width: 25),
              title: const Text("Montant journalier"),
              trailing: Text(carte.montantJournalier.toAmount(devise: "F")),
            ),
            ListTile(
              leading: Image.asset("assets/icons/calendar.png", height: 25),
              title: const Text("Date de debut"),
              trailing: Text(carte.debut.value.toFrenchDate),
            ),
            ListTile(
              leading: Image.asset("assets/icons/calendar.png", height: 25),
              title: const Text("Date de fin"),
              trailing: Text(carte.fin.value.toFrenchDate),
            ),
            ListTile(
              leading: Image.asset("assets/icons/facture.png", width: 25),
              title: const Text("Total"),
              trailing: Text(carte.montantJournalier.toAmount(devise: "F")),
            ),
            const Gap(10),
            const ListTile(
              horizontalTitleGap: 0,
              dense: true,
              leading: Icon(
                Icons.info,
                color: Colors.amber,
              ),
              title: Text("NB: Aucun montant versé n'est remboursable"),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CButton(
                      onPressed: () =>
                          launchUrl(Uri.parse("tel:${Const.supportTel}")),
                      child: const Text("Appeler pour info"),
                    ),
                  ),
                  const Gap(10),
                  Visibility(
                    visible: ctl.user == null || ctl.user?.isAdmin == false,
                    child: CButton(
                      minWidth: double.infinity,
                      color: AppColors.primary,
                      onPressed: () => ctl.cardSuscribing(carte),
                      child: const Text("Souscrire"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
