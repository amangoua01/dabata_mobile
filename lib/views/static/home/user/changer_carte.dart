import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/components/change_card_widget.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/views/controllers/home/user/changer_carte_vctl.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ChangerCarte extends StatelessWidget {
  final Carte carte;
  const ChangerCarte(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangerCarteVctl>(
      init: ChangerCarteVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Changement de carte"),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CButton(
                onPressed: () {},
                child: const Text("Changer de carte"),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView(
              children: [
                const Gap(20),
                ChangeCardWidget(
                    //image: carte.image.value,
                    title: carte.libelle.value,
                    amount: carte.montantJournalier!.toDouble(),
                    category: carte.categorie!.libelle.value,
                    radio: null),
                const Gap(20),
                const Text(
                  "Choisissez une autre carte",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Gap(10),
                Column(
                  children: ctl.cartes
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ChangeCardWidget(
                            //image: e.image.value,
                            title: e.libelle.value,
                            amount: e.montantJournalier!.toDouble(),
                            category: e.categorie!.libelle.value,
                            radio: Radio(
                              activeColor: AppColors.backColor,
                              value: 0,
                              groupValue: 1,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
