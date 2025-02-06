import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';

class PayerMaCotisation extends StatelessWidget {
  const PayerMaCotisation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payer ma cotisation"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://img.freepik.com/vecteurs-premium/collection-cadeaux-noel-comprenant-sac-cadeau-rouge-motif-flocon-neige-plusieurs-cadeaux-emballes-tous-fond-blanc_444390-25259.jpg",
                    )),
                title: Text("Haris Dabata"),
                subtitle: Text("07 00 00 00 00"),
              ),
            ),
          ),
          const CTextFormField(
            labelText: "Montant",
          ),
          DropdownButtonFormField(
              value: null,
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: null,
                  child: Text("01/01/2023"),
                ),
              ],
              onChanged: (null)),
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
          CButton(onPressed: () {}, child: const Text("Plusieurs paiement")),
          const Gap(10),
          CButton(
            child: const Text("Valider"),
            onPressed: () {},
          )
        ]),
      ),
    );
  }
}
