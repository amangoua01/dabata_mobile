import 'package:dabata_mobile/tools/components/historic_payment_card.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/historic_sub_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HistoriqueSubPage extends StatelessWidget {
  const HistoriqueSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoricSubPageVctl>(
      init: HistoricSubPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
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
                ),
              ),
              HistoricPaymentCard(
                amount: 10000,
                title: 'Carte 1',
                categorie: "Categorie 1",
                dateTime: DateTime.now(),
              ),
              HistoricPaymentCard(
                amount: 15000,
                title: 'Carte 2',
                categorie: "Categorie 2",
                dateTime: DateTime.now(),
              ),
              HistoricPaymentCard(
                amount: 20000,
                title: 'Carte 3',
                categorie: "Categorie 3",
                dateTime: DateTime.now(),
              ),
            ],
          ),
        );
      },
    );
  }
}
