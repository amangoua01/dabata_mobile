import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/widgets/wrapper_body_listview.dart';
import 'package:dabata_mobile/views/static/admin/articles/edition_article_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleListePage extends StatelessWidget {
  const ArticleListePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Articles")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Get.to(() => const EditionArticlePage()),
        child: const Icon(Icons.add),
      ),
      body: const WrapperBodyListView(
        loading: false,
        children: [],
      ),
    );
  }
}
