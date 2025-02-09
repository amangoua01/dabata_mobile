import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:dabata_mobile/views/static/admin/carte_souscription/edition_carte_souscription_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarteSouscriptionListePage extends StatelessWidget {
  const CarteSouscriptionListePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cartes de souscription")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Get.to(() => const EditionCarteSouscriptionPage()),
        child: const Icon(Icons.add),
      ),
      body: const WrapperBodyListView(
        loading: false,
        children: [],
      ),
    );
  }
}
