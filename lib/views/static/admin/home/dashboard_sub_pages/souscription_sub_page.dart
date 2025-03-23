import 'package:dabata_mobile/tools/components/card_suscribe.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/views/controllers/admin/souscription_sub_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SouscriptionSubPage extends StatelessWidget {
  const SouscriptionSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SouscriptionSubPageVctl>(
      init: SouscriptionSubPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(title: const Text("Liste des souscriptions")),
          body: ctl.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                )
              : RefreshIndicator(
                  onRefresh: ctl.getSouscriptions,
                  child: ListView.builder(
                    itemCount: ctl.souscriptions.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) => CardSuscribe(
                      ctl.souscriptions[index],
                      withUser: true,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
