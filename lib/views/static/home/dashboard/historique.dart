import 'package:dabata_mobile/tools/components/historic_payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
