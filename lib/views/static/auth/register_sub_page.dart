import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegisterSubPage extends StatelessWidget {
  const RegisterSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      children: [
        Lottie.asset("assets/lotties/register.json", height: 200),
        //const Gap(20),
        const CTextFormField(
          labelText: "Nom",
        ),
        const CTextFormField(
          labelText: "Prénom(s)",
        ),
        const CTextFormField(
          labelText: "Téléphone",
        ),
        const CTextFormField(
          labelText: "Email",
        ),
        const CTextFormField(
          labelText: "Lieu de résidence",
        ),
        const CTextFormField(
          labelText: "Mot de passe",
        ),
        const Gap(20),
        CButton(
          onPressed: () => Get.to(() => const Dashboard()),
          child: const Text("Valider"),
        ),
      ],
    );
  }
}
