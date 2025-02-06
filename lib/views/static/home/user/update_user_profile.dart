import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpdateUserProfile extends StatelessWidget {
  const UpdateUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mettre à jour mon profile"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: ListView(
            children: [
              const CTextFormField(
                labelText: "Nom",
              ),
              const Gap(10),
              const CTextFormField(
                labelText: "Prénom(s)",
              ),
              const Gap(10),
              const CTextFormField(
                labelText: "Téléphone",
              ),
              const Gap(10),
              const CTextFormField(
                labelText: "Email",
              ),
              const Gap(10),
              const CTextFormField(
                labelText: "Lieu de résidence",
              ),
              const Gap(20),
              CButton(onPressed: () {}, child: const Text("Mettre à jour"))
            ],
          ),
        ),
      ),
    );
  }
}
