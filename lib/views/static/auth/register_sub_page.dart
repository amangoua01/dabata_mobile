import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterSubPage extends StatelessWidget {
  const RegisterSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
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
