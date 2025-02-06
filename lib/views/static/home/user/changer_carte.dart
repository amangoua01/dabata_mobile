import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:dabata_mobile/tools/components/change_card_widget.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/views/controllers/home/user/changer_carte_vctl.dart';

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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                children: [
                  const Gap(20),
                  ChangeCardWidget(
                      image: carte.image.value,
                      title: carte.libelle.value,
                      amount: carte.montantJournalier!,
                      category: carte.categorie!.libelle.value,
                      radio: null),
                  const Gap(20),
                  Row(
                    children: [
                      const Text(
                        "Choisissez une autre carte",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 3),
                        child: Container(
                          height: 3,
                          width: 80,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Column(
                      children: ctl.cartes
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ChangeCardWidget(
                                  image: e.image.value,
                                  title: e.libelle.value,
                                  amount: e.montantJournalier!,
                                  category: e.categorie!.libelle.value,
                                  radio: Radio(
                                      value: 1,
                                      groupValue: 1,
                                      onChanged: (value) {}),
                                ),
                              ))
                          .toList()),
                  CButton(
                    onPressed: () {},
                    child: const Text('Changer de carte'),
                  )
                ],
              ),
            ),
          );
        });
  }
}
