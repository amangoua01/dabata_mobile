import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/views/controllers/admin/articles_sub_page_vct.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ArticlesSubPage extends StatelessWidget {
  const ArticlesSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesSubPageVctl>(
      init: ArticlesSubPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(title: const Text("Cumule des gains")),
          body: ctl.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : ListView(children: [
                  ...ctl.articlesCumules.map(
                    (e) => ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary.shade100,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: AppColors.primary.shade100,
                          child: Image.asset(
                            "assets/images/marche-removebg.png",
                            height: 35,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        e.libelle.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          e.quantiteCumul!.toInt().toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
        );
      },
    );
  }
}
