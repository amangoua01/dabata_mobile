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
          prefixIcon: Icon(Icons.person),
          labelText: "Nom",
        ),
        const CTextFormField(
          prefixIcon: Icon(Icons.person),
          labelText: "Prénom(s)",
        ),
        const CTextFormField(
          prefixIcon: Icon(Icons.phone_android),
          labelText: "Téléphone",
        ),
        const CTextFormField(
          prefixIcon: Icon(Icons.email),
          labelText: "Email",
        ),
        const CTextFormField(
          prefixIcon: Icon(Icons.map),
          labelText: "Lieu de résidence",
        ),
        const CTextFormField(
          prefixIcon: Icon(Icons.lock),
          labelText: "Mot de passe",
        ),
        const Gap(20),
        CButton(
          onPressed: () => Get.to(() => const Dashboard()),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login),
              Gap(5),
              Text("Valider"),
            ],
          ),
        ),
      ],
    );
  }
}
