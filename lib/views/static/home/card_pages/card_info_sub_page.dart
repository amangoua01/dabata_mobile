import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';
import 'package:dabata_mobile/views/static/auth/register_sub_page.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:get/get.dart';

class CardInfoSubPage extends StatelessWidget {
  final Carte carte;
  const CardInfoSubPage(this.carte, {super.key});

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
        ListTile(
          title: Text(carte.libelle.value),
          subtitle: Text(carte.categorie!.libelle.value),
          trailing: Text(carte.montantJournalier.toAmount()),
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: CButton(
                      onPressed: () {},
                      child: const Text("Appeler pour info"))),
              SizedBox(
                width: double.infinity,
                child: CButton(
                    onPressed: () => Get.to(() => const RegisterSubPage()),
                    child: const Text("Souscrire")),
              ),
              SizedBox(
                width: double.infinity,
                child: CButton(
                    onPressed: () => Get.offAll(() => const AdminDashboard()),
                    child: const Text("Admin")),
              ),
            ],
          ),
        ),

        /* ListTile(
          title: Text(carte.libelle.value),
          subtitle: Text(carte.categorie!.libelle.value),
          trailing: Text(carte.montantJournalier.toAmount()),
        ),
        ListTile(
          title: const Text("Date de debut"),
          trailing: Text(carte.debut.value),
        ),
        ListTile(
          title: const Text("Date de fin"),
          trailing: Text(carte.fin.value),
        ) */
      ],
    );
  }
}
