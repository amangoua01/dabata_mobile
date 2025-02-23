import 'package:dabata_mobile/tools/components/historic_payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Historique extends StatelessWidget {
  const Historique({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Historique"),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Mes dernières opérations",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
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
          )),
    );
  }
}
