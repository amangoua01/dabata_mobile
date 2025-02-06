import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_text_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:dabata_mobile/views/static/auth/register_sub_page.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginSubPage extends StatelessWidget {
  const LoginSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Lottie.asset("assets/lotties/epargner.json", height: 250),
          const CTextFormField(
            labelText: "Nom d'utilisateur",
          ),
          const CTextFormField(
            labelText: "Mot de passe",
          ),
          const Gap(20),
          CButton(
            child: const Text("Connexion"),
            onPressed: () => Get.offAll(() => const Dashboard()),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CTextButton(
                  child: const Text(
                    "S'inscrire ?",
                    style: TextStyle(color: AppColors.primary),
                  ),
                  onPressed: () => Get.to(() => const RegisterSubPage())),
              CTextButton(
                onPressed: () {},
                child: const Text(
                  "Mot de passe oublié?",
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
