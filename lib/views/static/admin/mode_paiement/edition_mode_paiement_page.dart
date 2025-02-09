import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditionModePaiementPage extends StatelessWidget {
  const EditionModePaiementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edition mode de paiement")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CTextFormField(
            labelText: "Nom",
          ),
          const Gap(20),
          CButton(onPressed: () {}, child: const Text("Valider"))
        ],
      ),
    );
  }
}
