import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_text_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class LoginSubPage extends StatelessWidget {
  const LoginSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
          onPressed: () {},
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
    );
  }
}
