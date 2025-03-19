import 'package:dabata_mobile/models/souscription.dart';
import 'package:flutter/material.dart';

class DetailsSouscriptionSubPage extends StatelessWidget {
  final Souscription souscription;
  const DetailsSouscriptionSubPage(
    this.souscription, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Détails souscription")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [],
      ),
    );
  }
}
