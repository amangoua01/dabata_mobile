import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:dabata_mobile/views/static/admin/categories/edition_categorie_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorieListePage extends StatelessWidget {
  const CategorieListePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catégories")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Get.to(() => const EditionCategoriePage()),
        child: const Icon(Icons.add),
      ),
      body: WrapperBodyListView(
        loading: false,
        children: const [],
        onRefresh: () async {},
      ),
    );
  }
}
