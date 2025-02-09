import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:dabata_mobile/views/static/admin/mode_paiement/edition_mode_paiement_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModePaiementListePage extends StatelessWidget {
  const ModePaiementListePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mode de paiement")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Get.to(() => const EditionModePaiementPage()),
        child: const Icon(Icons.add),
      ),
      body: const WrapperBodyListView(
        loading: false,
        children: [],
      ),
    );
  }
}
