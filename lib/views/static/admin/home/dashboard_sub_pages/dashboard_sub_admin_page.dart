import 'package:dabata_mobile/tools/components/c_card.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/indicator.dart';
import 'package:dabata_mobile/tools/widgets/placeholder_widget.dart';
import 'package:dabata_mobile/views/controllers/admin/dashboard_sub_admin_page_vctl.dart';
import 'package:dabata_mobile/views/static/admin/home/edtion_user_page.dart';
import 'package:dabata_mobile/views/static/home/user/payer_ma_cotisation.dart';
import 'package:dabata_mobile/views/static/home/user/user_profile.dart';
import 'package:dabata_mobile/views/static/notifications/list_notif_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DashboardSubAdminPage extends StatelessWidget {
  const DashboardSubAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardSubAdminPageVctl>(
      init: DashboardSubAdminPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Get.to(() => const UserProfile()),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      "assets/icons/user2.png",
                    ),
                  ),
                ),
              ),
            ),
            title: const Text("Admin Dashboard"),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications, size: 30),
                onPressed: () => Get.to(() => const ListNotifPage()),
              )
            ],
          ),
          body: PlaceHolderWidget(
            condition: !ctl.loading,
            placeholder: const Center(child: CircularProgressIndicator()),
            child: RefreshIndicator(
              onRefresh: ctl.getData,
              child: ListView(
                children: [
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.9,
                    ),
                    children: [
                      CCard(
                        image: "assets/icons/user2.png",
                        amount: ctl.usersCount,
                        title: "Inscrit(e)",
                        unite: "Pers.",
                      ),
                      CCard(
                        unite: "F",
                        title: "Montant totale",
                        amount: ctl.totalAmount.toInt(),
                      ),
                      CCard(
                        unite: "F",
                        title: "Montant cotisé",
                        amount: ctl.totalAmountBuyed.toInt(),
                      ),
                      CCard(
                        unite: "F",
                        title: "Montant restant",
                        amount: ctl.totalAmountRest.toInt(),
                      ),
                      const CCard(
                        amount: 50000,
                        color: null,
                        image: "assets/icons/carte2.gif",
                        title: "Nb. cartes",
                        unite: "",
                      ),
                      ...ctl.catStatData.map((e) => CCard(
                            amount: e.nombreSouscriptions ?? 0,
                            image: "assets/icons/souscription.png",
                            title:
                                'Nb. souscriptions ${e.categorieLibelle.value}',
                            unite: " ",
                          )),
                    ],
                  ),
                  const Gap(10),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      bottom: 10,
                      top: 10,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 250,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: PieChart(
                            PieChartData(
                              sectionsSpace: 2,
                              centerSpaceRadius: 40,
                              sections: ctl.pieChartDataByCategory.map((data) {
                                Color color = AppColors.primary;
                                if (data['category'] == 'Marché') {
                                  color = AppColors.primary;
                                } else if (data['category'] == 'Mixte') {
                                  color = Colors.blue.shade500;
                                } else if (data['category'] == 'Gadget') {
                                  color = Colors.greenAccent.shade400;
                                }

                                return PieChartSectionData(
                                  color: color,
                                  value: data['total'].toDouble(),
                                  title:
                                      "${data['percentage'].toStringAsFixed(1)}%",
                                  radius: 50,
                                  titleStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                );
                              }).toList(),
                            ),
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.linear,
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...ctl.pieChartDataByCategory.map((data) {
                                Color color = AppColors.primary;
                                if (data['category'] == 'Marché') {
                                  color = AppColors.primary;
                                } else if (data['category'] == 'Mixte') {
                                  color = Colors.blue.shade500;
                                } else if (data['category'] == 'Gadget') {
                                  color = Colors.greenAccent.shade400;
                                }

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Indicator(
                                    color: color,
                                    text:
                                        "${data['category']} (${data['total']})",
                                    isSquare: true,
                                  ),
                                );
                              }),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: SpeedDial(
            spacing: 3,
            backgroundColor: AppColors.primary,
            children: [
              // SpeedDialChild(
              //   backgroundColor: AppColors.primary,
              //   foregroundColor: Colors.white,
              //   label: "Ajouter une catégorie",
              //   child: const Icon(Icons.add, color: Colors.white),
              //   onTap: () => Get.to(() => const EditionCategoriePage()),
              // ),
              // SpeedDialChild(
              //   backgroundColor: AppColors.primary,
              //   foregroundColor: Colors.white,
              //   label: "Ajouter une carte",
              //   child: Image.asset(
              //     "assets/icons/add_card.png",
              //     height: 30,
              //     color: Colors.white,
              //   ),
              //   onTap: () => Get.to(() => const EditionCarteSouscriptionPage()),
              // ),
              SpeedDialChild(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                label: "Ajouter un utilisateur",
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onTap: () => Get.to(() => const EdtionUserPage()),
              ),
              SpeedDialChild(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                label: "Ajouter un paiement",
                child: Image.asset("assets/icons/payer.png",
                    height: 30, color: Colors.white),
                onTap: () => Get.to(() => const PayerMaCotisation()),
              ),
            ],
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
