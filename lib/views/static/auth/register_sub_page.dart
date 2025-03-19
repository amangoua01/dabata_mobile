import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:dabata_mobile/views/controllers/auth/register_vctl.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegisterSubPage extends StatelessWidget {
  const RegisterSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterVctl>(
      init: RegisterVctl(),
      builder: (ctl) {
        return ListView(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          children: [
            Lottie.asset("assets/lotties/register.json", height: 200),
            //const Gap(20),
            CTextFormField(
              labelText: "Nom",
              controller: ctl.nom,
              prefixIcon: const Icon(Icons.person),
            ),
            CTextFormField(
              labelText: "Prénom(s)",
              controller: ctl.prenom,
              prefixIcon: const Icon(Icons.person),
            ),
            CTextFormField(
              labelText: "Téléphone",
              controller: ctl.telephone,
              keyboardType: TextInputType.phone,
              prefixIcon: const Icon(Icons.phone_android),
            ),
            CTextFormField(
              labelText: "Email",
              controller: ctl.email,
              prefixIcon: const Icon(Icons.email),
            ),
            CTextFormField(
              labelText: "Lieu de résidence",
              controller: ctl.lieuResidence,
              prefixIcon: const Icon(Icons.map),
            ),
            CTextFormField(
              labelText: "Mot de passe",
              controller: ctl.password,
              obscureText: ctl.isObscureText,
              prefixIcon: ctl.isObscureText
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility),
              onTap: () => ctl.toggleObscureText(),
            ),
            const Gap(20),
            CButton(
              onPressed: () => ctl.submit(),
              //Get.to(() => const Dashboard()),
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
      },
    );
  }
}
