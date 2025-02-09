import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CardGainsSubPage extends StatelessWidget {
  final Carte carte;
  const CardGainsSubPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const ["2 poulets", "1 sac de riz", "1 bouteille de gaz B12"]
          .map(
            (e) => ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primary.shade100,
                child: Image.asset(
                  "assets/icons/cadeau.png",
                  height: 30,
                ),
              ),
              title: Text(e),
            ),
          )
          .toList(),
      // ListTile(
      //   leading: Icon(Icons.wallet_giftcard_sharp),
      //   title: Text("2 poulets"),
      // ),
      // ListTile(
      //   leading: Icon(Icons.wallet_giftcard_sharp),
      //   title: Text("1 sac de riz"),
      // ),
      // ListTile(
      //   leading: Icon(Icons.wallet_giftcard_sharp),
      //   title: Text("1 bouteille de gaz B12"),
      // ),
      // ],
    );
  }
}
