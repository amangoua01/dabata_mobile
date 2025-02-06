import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_outlined_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_text_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:dabata_mobile/views/static/auth/login_sub_page.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegisterSubPage extends StatelessWidget {
  const RegisterSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              "LOGO",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
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
                onPressed: () => Get.offAll(() => const Dashboard()),
                child: const Text("Valider")),
            CTextButton(
                onPressed: () => Get.offAll(() => const LoginSubPage()),
                child: const Text(
                  "J'ai deja un compte",
                  style: TextStyle(color: AppColors.primary),
                )),
          ],
        ),
      ),
    );
  }
}
