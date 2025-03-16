import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/views/static/admin/user_info.dart';
import 'package:dabata_mobile/views/static/home/user/details_user/historic_sub_page.dart';
import 'package:dabata_mobile/views/static/home/user/details_user/user_card_subscribed_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/tools/widgets/custom_tab_bar.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:dabata_mobile/views/controllers/home/user/user_detail_page_vctl.dart';

class UserDetailPage extends StatelessWidget {
  final User user;
  const UserDetailPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDetailPageVctl>(
      init: UserDetailPageVctl(),
      builder: (ctl) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            title: const Text("Détails utilisateur"),
          ),
          body: CustomTabBar(
            color: Colors.white,
            controller: ctl.controller,
            tabs: const [
              Tab(text: "Infos utilisateur"),
              Tab(text: "carte souscrite"),
              Tab(
                text: "Historique des paiement",
              ),
            ],
            children: [
              UserInfo(user),
              const UserCardSubscribedSubPage(),
              const HistoricSubPage(),
            ],
          ),
        );
      },
    );
  }
}
