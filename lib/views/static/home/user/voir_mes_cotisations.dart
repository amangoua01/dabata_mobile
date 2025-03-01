import 'package:dabata_mobile/tools/components/tab_calendar.dart';
import 'package:flutter/material.dart';

class VoirMesCotisations extends StatelessWidget {
  const VoirMesCotisations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voir mes cotisations"),
      ),
      body: const Center(
        child: TabCalendar(),
      ),
    );
  }
}
