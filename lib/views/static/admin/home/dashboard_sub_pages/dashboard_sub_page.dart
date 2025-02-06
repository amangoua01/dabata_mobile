import 'package:dabata_mobile/tools/components/c_card.dart';
import 'package:dabata_mobile/tools/components/description_card.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/views/controllers/admin/dashboard_sub_page_vctl.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DashboardSubPage extends StatelessWidget {
  const DashboardSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardSubPageVctl>(
        init: DashboardSubPageVctl(),
        builder: (ctl) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Admin Dashboard"),
              ),
              body: ListView(
                children: const [
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DescriptionCard(nombre: 50, title: "Inscrit(e)"),
                      CCard(amount: 30000000, title: "Cotisation cumulée"),
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CCard(amount: 50000000, title: "Rest à cotisé"),
                      DescriptionCard(nombre: 150, title: "Nombre cartes"),
                    ],
                  )
                ],
              ),

              /* floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ), */
              floatingActionButton: SpeedDial(
                spacing: 3,
                backgroundColor: AppColors.primary,
                children: [
                  SpeedDialChild(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    label: "Ajouter une catégorie",
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    //onTap: () => Get.to(() => const CreatePaymentLink()),
                  ),
                  SpeedDialChild(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    label: "Ajouter une carte",
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onTap: () => Get.to(() => const CardListePage()),
                  ),
                ],
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ));
        });
  }
}
