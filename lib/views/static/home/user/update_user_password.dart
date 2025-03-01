import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class UpdateUserPassword extends StatelessWidget {
  const UpdateUserPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mettre à jour mon mot de passe"),
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: ListView(children: [
                  Lottie.asset("assets/lotties/password.json", height: 150),
                  const Gap(20),
                  const CTextFormField(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Ancien mot de passe",
                  ),
                  const Gap(10),
                  const CTextFormField(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Nouveau mot de passe",
                  ),
                  const Gap(10),
                  const CTextFormField(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Confirmer le nouveau mot de passe",
                  ),
                  const Gap(10),
                  CButton(
                    child: const Text("Mettre à jour"),
                    onPressed: () {},
                  )
                ]))));
  }
}
