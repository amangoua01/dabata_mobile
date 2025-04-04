import 'package:dabata_mobile/tools/components/historic_payment_card.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:dabata_mobile/views/controllers/admin/paiement_sub_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PaiementSubPage extends StatelessWidget {
  const PaiementSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaiementSubPageVctl>(
      init: PaiementSubPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(title: const Text("Liste des paiements")),
          body: WrapperBodyListView(
            onRefresh: ctl.getPaiements,
            loading: ctl.isLoading,
            children: ctl.paiements
                .map(
                  (e) => HistoricPaymentCard(
                    amount: e.montant ?? 0,
                    title: "Mode de paiement :"
                        " ${e.modePaiement?.libelle.defaultValue("n/a")}",
                    dateTime: e.datePaiement
                        .defaultValue(DateTime.now().toIso8601String())
                        .toFrenchDate,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
