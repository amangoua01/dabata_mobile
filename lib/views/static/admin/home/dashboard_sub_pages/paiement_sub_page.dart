import 'package:dabata_mobile/tools/components/c_list_tile.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PaiementSubPage extends StatelessWidget {
  const PaiementSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paiement")),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          CListTile(
            leading: CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.primary.shade100,
                child: Image.asset(
                  "assets/icons/payer.png",
                  height: 30,
                  fit: BoxFit.cover,
                )),
            title: const Text("Payer"),
            subtitle: const Text("Payer une facture"),
            trailing: const Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}
