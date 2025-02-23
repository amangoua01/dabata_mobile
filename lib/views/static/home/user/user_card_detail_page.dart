import 'package:dabata_mobile/tools/widgets/custom_tab_bar.dart';
import 'package:dabata_mobile/views/controllers/home/user/user_card_detail_page_vctl.dart';
import 'package:dabata_mobile/views/static/home/user/user_card_info_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_gains_sub_page.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class UserCardDetailPage extends StatelessWidget {
  final Carte carte;
  const UserCardDetailPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserCardDetailPageVctl>(
      init: UserCardDetailPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Détails"),
          ),
          body: CustomTabBar(
            color: Colors.white,
            controller: ctl.controller,
            tabs: const [
              Tab(text: "Infos"),
              Tab(text: "Gains/Articles"),
            ],
            children: [
              UserCardInfoSubPage(carte),
              CardGainsSubPage(carte),
            ],
          ),
        );
      },
    );
  }
}
