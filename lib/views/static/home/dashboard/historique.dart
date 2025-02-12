import 'package:dabata_mobile/tools/components/historic_payment_card.dart';
import 'package:flutter/material.dart';

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
                date: "01/01/2023",
                dateTime: DateTime.now(),
              ),
              HistoricPaymentCard(
                amount: 15000,
                date: "01/01/2023",
                dateTime: DateTime.now(),
              ),
              HistoricPaymentCard(
                amount: 20000,
                date: "01/01/2023",
                dateTime: DateTime.now(),
              ),
            ],
          )),
    );
  }
}
