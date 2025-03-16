import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';

class CardGainsSubPage extends StatelessWidget {
  final Carte carte;
  const CardGainsSubPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...carte.articles!.map(
          (e) => ListTile(
            leading: Container(
              decoration: BoxDecoration(
                //color: AppColors.primary.shade100,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary.shade100,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.primary.shade100,
                child: Image.asset(
                  carte.image.value,
                  //height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              e.libelle.toString(),
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                shape: BoxShape.circle,
              ),
              child: Text(
                e.qte.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.primary.shade100,
            child: Image.asset(
              "assets/icons/cadeau.png",
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          title: const Text(
            "Montant rendu",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(10),
              //shape: BoxShape.circle,
            ),
            child: Text(
              carte.montantRendu!.toAmount(
                devise: "F",
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
