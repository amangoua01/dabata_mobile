import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:dabata_mobile/tools/widgets/custom_tab_bar.dart';
import 'package:dabata_mobile/views/controllers/home/card_details_page_vctl.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_info_sub_page.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_gains_sub_page.dart';

class CardDetailPage extends StatelessWidget {
  final Carte carte;
  const CardDetailPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardDetailsPageVctl>(
      init: CardDetailsPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Détails"),
          ),
          body: CustomTabBar(
            controller: ctl.controller,
            tabs: const [
              Tab(text: "Infos"),
              Tab(text: "Gains/Articles"),
            ],
            children: [
              CardInfoSubPage(carte),
              CardGainsSubPage(carte),
            ],
          ),
        );
      },
    );
  }
}
