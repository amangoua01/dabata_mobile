import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CardGainsSubPage extends StatelessWidget {
  final Carte carte;
  const CardGainsSubPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        {
          "type": "poulets de chair",
          "nombre": 1,
        },
        {
          "type": "riz cassé sans brisure de 50kg",
          "nombre": 1,
        },
        {
          "type": "gaz butane B12",
          "nombre": 1,
        }
      ]
          .map(
            (e) => ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primary.shade100,
                child: Image.asset(
                  "assets/icons/cadeau.png",
                  height: 30,
                ),
              ),
              title: Text(e["type"].toString()),
              trailing: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  e["nombre"].toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
