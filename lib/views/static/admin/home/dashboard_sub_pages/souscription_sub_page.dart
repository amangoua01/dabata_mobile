import 'package:dabata_mobile/tools/components/c_list_tile.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/views/controllers/admin/souscription_sub_page_vctl.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/details_souscription_sub_page.dart';
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
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : ListView(
                  children: ctl.souscriptions
                      .map((e) => CListTile(
                            onTap: () =>
                                Get.to(() => DetailsSouscriptionSubPage(e)),
                            leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: AppColors.primary.shade100,
                                child: const Image(
                                  image: AssetImage(
                                      "assets/images/marche-removebg.png"),
                                  height: 30,
                                  fit: BoxFit.cover,
                                )),
                            title: Text(e.carte!.libelle.value),
                            subtitle: Text(e.user!.fullname.value),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ))
                      .toList(),
                ),
        );
      },
    );
  }
}
