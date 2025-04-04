import 'package:dabata_mobile/tools/components/card_suscribe.dart';
import 'package:dabata_mobile/tools/constants/etat_souscription.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/tools/widgets/custom_tab_bar.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:dabata_mobile/views/controllers/admin/souscription_sub_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SouscriptionSubPage extends StatelessWidget {
  const SouscriptionSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SouscriptionSubPageVctl>(
      init: SouscriptionSubPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(title: const Text("Liste des souscriptions")),
          body: CustomTabBar(
            color: Colors.white,
            tabs: const [
              Tab(text: "En cours"),
              Tab(text: "Soldées"),
              Tab(text: "Annulées"),
            ],
            children: [
              WrapperBodyListView(
                loading: ctl.isLoading,
                listPadding: const EdgeInsets.all(10),
                onRefresh: ctl.getSouscriptions,
                children: ctl.souscriptions
                    .where((e) =>
                        EtatSouscription.fromCode(e.etat.value).code ==
                        EtatSouscription.enCours.code)
                    .map((e) => CardSuscribe(e))
                    .toList(),
              ),
              WrapperBodyListView(
                loading: ctl.isLoading,
                listPadding: const EdgeInsets.all(10),
                onRefresh: ctl.getSouscriptions,
                children: ctl.souscriptions
                    .where((e) =>
                        EtatSouscription.fromCode(e.etat.value).code ==
                        EtatSouscription.soldee.code)
                    .map((e) => CardSuscribe(e))
                    .toList(),
              ),
              WrapperBodyListView(
                loading: ctl.isLoading,
                listPadding: const EdgeInsets.all(10),
                onRefresh: ctl.getSouscriptions,
                children: ctl.souscriptions
                    .where((e) =>
                        EtatSouscription.fromCode(e.etat.value).code ==
                        EtatSouscription.annulee.code)
                    .map((e) => CardSuscribe(e))
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
