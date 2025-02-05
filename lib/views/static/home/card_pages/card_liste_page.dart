import 'package:dabata_mobile/tools/widgets/card_item.dart';
import 'package:dabata_mobile/views/controllers/home/card_liste_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardListePage extends StatelessWidget {
  const CardListePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CardListePageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(title: const Text("Cartes disponibles")),
          body: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: .7,
            ),
            itemCount: ctl.cartes.length,
            itemBuilder: (context, index) {
              return CardItem(ctl.cartes[index]);
            },
          ),
        );
      },
    );
  }
}
