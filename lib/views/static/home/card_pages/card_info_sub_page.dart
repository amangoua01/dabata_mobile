import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:flutter/material.dart';

class CardInfoSubPage extends StatelessWidget {
  final Carte carte;
  const CardInfoSubPage(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            carte.image.value,
            height: 200,
          ),
        ),
      ],
    );
  }
}
