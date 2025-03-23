import 'package:dabata_mobile/tools/components/historic_payment_card.dart';
import 'package:dabata_mobile/tools/components/tab_calendar.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:dabata_mobile/views/controllers/home/user/voir_mes_cotisations_vctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoirMesCotisations extends StatelessWidget {
  final int souscriptionId;
  const VoirMesCotisations(this.souscriptionId, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoirMesCotisationsVctl>(
      init: VoirMesCotisationsVctl(souscriptionId),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Voir mes cotisations"),
          ),
          body: Column(
            children: [
              TabCalendar(
                paiements: ctl.paiements,
                onDaySelected: (e) {
                  ctl.selectedDate = e;
                  ctl.update();
                },
              ),
              const Divider(
                thickness: 2,
                height: 50,
              ),
              Expanded(
                child: WrapperBodyListView(
                  loading: false,
                  children: ctl.paiements
                      .where((e) => e.isSameDatePaiement(ctl.selectedDate))
                      .map(
                        (e) => HistoricPaymentCard(
                          amount: e.montant.value,
                          title:
                              'Mode de paiement : ${e.modePaiement?.libelle ?? 'n/a'}',
                          // categorie: p.categorie.libelle,
                          dateTime: e.datePaiement?.toString() ??
                              DateTime.now().toString(),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
