import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/edtion_user_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EdtionUserPage extends StatelessWidget {
  const EdtionUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EdtionUserPageVctl>(
        init: EdtionUserPageVctl(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(title: const Text("Edition utilisateur")),
            body: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Lottie.asset("assets/lotties/profile.json", height: 150),
                const Gap(10),
                CTextFormField(
                  controller: ctl.nom,
                  labelText: "Nom",
                  prefixIcon: const Icon(Icons.person),
                ),
                CTextFormField(
                  controller: ctl.prenom,
                  labelText: "Prénom(s)",
                  prefixIcon: const Icon(Icons.person),
                ),
                CTextFormField(
                  controller: ctl.telephone,
                  labelText: "Téléphone",
                  prefixIcon: const Icon(Icons.phone),
                ),
                CTextFormField(
                  controller: ctl.email,
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.phone),
                ),
                CTextFormField(
                  controller: ctl.lieuResidence,
                  labelText: "Lieu de résidence",
                  prefixIcon: const Icon(Icons.phone),
                ),
                CTextFormField(
                  controller: ctl.password,
                  labelText: "Mot de passe",
                  prefixIcon: const Icon(Icons.phone),
                ),
                const Gap(20),
                CButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/valider.png",
                        height: 20,
                        color: Colors.white,
                      ),
                      const Gap(5),
                      const Text("Valider"),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
