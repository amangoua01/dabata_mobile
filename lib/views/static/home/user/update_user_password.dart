import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                  const CTextFormField(
                    labelText: "Ancien mot de passe",
                  ),
                  const Gap(10),
                  const CTextFormField(
                    labelText: "Nouveau mot de passe",
                  ),
                  const Gap(10),
                  const CTextFormField(
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
