import 'package:dabata_mobile/views/static/auth/register_sub_page.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CardGainsSubPage extends StatelessWidget {
  final Carte carte;
  const CardGainsSubPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            carte.image.value,
            height: 200,
          ),
        ),
        const ListTile(
          leading: Icon(Icons.monetization_on_outlined),
          title: Text("2 poulets"),
        ),
        const ListTile(
          leading: Icon(Icons.monetization_on_outlined),
          title: Text("1 sac de riz"),
        ),
        const ListTile(
          leading: Icon(Icons.monetization_on_outlined),
          title: Text("1 bouteille de gaz B12"),
        ),
        /* ListTile(
          title: const Text("Date de fin"),
          trailing: Text(carte.fin.value),
        ),
        ListTile(
          title: const Text("Total"),
          trailing: Text(carte.montantJournalier.toAmount()),
        ), */
        const Gap(50),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: CButton(
                    onPressed: () => Get.to(() => const RegisterSubPage()),
                    child: const Text("Souscrire")),
              ),
              SizedBox(
                  width: double.infinity,
                  child: CButton(
                      onPressed: () {},
                      child: const Text("Appeler pour info"))),
            ],
          ),
        ),
      ],
    );
  }
}
