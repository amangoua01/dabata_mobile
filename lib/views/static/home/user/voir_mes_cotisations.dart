import 'package:dabata_mobile/tools/components/tab_calendar.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:flutter/material.dart';

class VoirMesCotisations extends StatelessWidget {
  const VoirMesCotisations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voir mes cotisations"),
      ),
      body: const Column(
        children: [
          TabCalendar(),
          Divider(
            thickness: 2,
            height: 50,
          ),
          Expanded(
            child: WrapperBodyListView(
              loading: false,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
