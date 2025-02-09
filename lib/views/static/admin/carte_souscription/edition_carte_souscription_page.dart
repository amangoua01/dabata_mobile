import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditionCarteSouscriptionPage extends StatelessWidget {
  const EditionCarteSouscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edition carte de souscription")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CTextFormField(
            labelText: "Nom",
          ),
          const CTextFormField(
            labelText: "Date de début",
          ),
          const CTextFormField(
            labelText: "Date de fin",
          ),
          const CTextFormField(
            labelText: "Montant",
          ),
          const CTextFormField(
            labelText: "Date de début de livraison",
          ),
          const CTextFormField(
            labelText: "Date de fin de livraison",
          ),
          const CTextFormField(
            labelText: "Montant rendu",
          ),
          const Gap(20),
          CButton(onPressed: () {}, child: const Text("Valider"))
        ],
      ),
    );
  }
}
