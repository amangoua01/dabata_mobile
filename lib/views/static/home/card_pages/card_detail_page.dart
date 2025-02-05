import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_gains_sub_page.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_info_sub_page.dart';
import 'package:flutter/material.dart';

class CardDetailPage extends StatelessWidget {
  final Carte carte;
  const CardDetailPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Détails"),
          bottom: const TabBar(tabs: [
            Tab(text: "Infos"),
            Tab(text: "Gains/Articles"),
          ]),
        ),
        body: TabBarView(
          children: [
            CardInfoSubPage(carte),
            const CardGainsSubPage(),
          ],
        ),
      ),
    );
  }
}
