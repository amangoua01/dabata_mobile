import 'package:dabata_mobile/models/carte.dart';
import 'package:flutter/material.dart';

class CardGainsSubPage extends StatelessWidget {
  final Carte carte;
  const CardGainsSubPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.wallet_giftcard_sharp),
          title: Text("2 poulets"),
        ),
        ListTile(
          leading: Icon(Icons.wallet_giftcard_sharp),
          title: Text("1 sac de riz"),
        ),
        ListTile(
          leading: Icon(Icons.wallet_giftcard_sharp),
          title: Text("1 bouteille de gaz B12"),
        ),
      ],
    );
  }
}
