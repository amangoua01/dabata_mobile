import 'package:dabata_mobile/tools/components/user_description_card.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_drop_down_form_field.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PayerMaCotisation extends StatelessWidget {
  const PayerMaCotisation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faire un paiement"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: UserDescriptionCard(
              image: "assets/icons/user.png",
              fullName: 'Hassan Dabata',
              phoneNumber: '07 00 00 00 00',
            ),
          ),
          CDropDownFormField<String>(
            labelText: "Carte",
            items: (p0, p1) => [""],
            compareFn: (a, b) => true,
          ),
          const CTextFormField(
            labelText: "Montant",
          ),
          const Gap(10),
          CTextFormField(
            readOnly: true,
            labelText: "Date de paiement",
            onTap: () {
              showDatePicker(
                context: context,
                currentDate: DateTime.now(),
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(3000),
              );
            },
          ),
          const Gap(10),
          CButton(
            height: 50,
            child: const Text("Valider"),
            onPressed: () {},
          )
        ]),
      ),
    );
  }
}
