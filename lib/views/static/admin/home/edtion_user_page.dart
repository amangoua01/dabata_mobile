import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class EdtionUserPage extends StatelessWidget {
  const EdtionUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edition utilisateur")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Lottie.asset("assets/lotties/profile.json", height: 150),
          const Gap(10),
          const CTextFormField(
            labelText: "Nom",
            prefixIcon: Icon(Icons.person),
          ),
          const CTextFormField(
            labelText: "Prénom(s)",
            prefixIcon: Icon(Icons.person),
          ),
          const CTextFormField(
            labelText: "Téléphone",
            prefixIcon: Icon(Icons.phone),
          ),
          const Gap(20),
          CButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/valider.png",
                  height: 20,
                  color: Colors.white,
                ),
                const Gap(5),
                const Text("Valider"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
