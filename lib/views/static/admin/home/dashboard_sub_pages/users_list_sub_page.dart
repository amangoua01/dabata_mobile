import 'package:dabata_mobile/tools/components/user_description_card.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UsersListSubPage extends StatelessWidget {
  const UsersListSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des utilisateurs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            CTextField(
              labelText: "Rechercher un utilisateur",
              suffixIcon: Icon(Icons.search),
            ),
            Gap(10),
            UserDescriptionCard(
              image:
                  "https://img.freepik.com/vecteurs-premium/collection-cadeaux-noel-comprenant-sac-cadeau-rouge-motif-flocon-neige-plusieurs-cadeaux-emballes-tous-fond-blanc_444390-25259.jpg",
              fullName: 'Hassan Dabata',
              phoneNumber: '07 00 00 00 00',
            ),
            Gap(10),
            UserDescriptionCard(
              image:
                  "https://img.freepik.com/vecteurs-premium/collection-cadeaux-noel-comprenant-sac-cadeau-rouge-motif-flocon-neige-plusieurs-cadeaux-emballes-tous-fond-blanc_444390-25259.jpg",
              fullName: 'Hassan Dabata',
              phoneNumber: '07 00 00 00 00',
            ),
            Gap(10),
            UserDescriptionCard(
              image:
                  "https://img.freepik.com/vecteurs-premium/collection-cadeaux-noel-comprenant-sac-cadeau-rouge-motif-flocon-neige-plusieurs-cadeaux-emballes-tous-fond-blanc_444390-25259.jpg",
              fullName: 'Hassan Dabata',
              phoneNumber: '07 00 00 00 00',
            ),
            Gap(10),
            UserDescriptionCard(
              image:
                  "https://img.freepik.com/vecteurs-premium/collection-cadeaux-noel-comprenant-sac-cadeau-rouge-motif-flocon-neige-plusieurs-cadeaux-emballes-tous-fond-blanc_444390-25259.jpg",
              fullName: 'Hassan Dabata',
              phoneNumber: '07 00 00 00 00',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
