import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:dabata_mobile/tools/components/historic_payment_card.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/historic_sub_page_vctl.dart';

class HistoriqueSubPage extends StatelessWidget {
  const HistoriqueSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoricSubPageVctl>(
      init: HistoricSubPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Historique des paiements"),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10),
                child: Text(
                  "Mes dernières opérations",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ...ctl.paiements.map((p) => HistoricPaymentCard(
                    amount: p.montant ?? 0,
                    title:
                        'Mode de paiement : ${p.modePaiement?.libelle ?? 'n/a'}',
                    //categorie: p.categorie.libelle,
                    dateTime:
                        p.datePaiement?.toString() ?? DateTime.now().toString(),
                  )),
            ],
          ),
        );
      },
    );
  }
}
