import 'package:dabata_mobile/tools/components/c_card.dart';
import 'package:dabata_mobile/tools/components/card_suscribe.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/dashboard_vctl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class EnCoursPage extends StatelessWidget {
  const EnCoursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardVctl>(
      init: DashboardVctl(),
      builder: (ctl) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const Gap(20),
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.9,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CCard(
                    title: "Montant restant",
                    amount: ctl.totalAmountRest.toInt(),
                    unite: "F",
                  ).animate().flipH(
                        delay: 500.ms,
                        duration: 500.ms,
                        curve: Curves.easeInOut,
                      ),
                  CCard(
                    title: "Montant total",
                    amount: ctl.totalAmount.toInt(),
                    unite: "F",
                  ).animate().flip(
                        delay: 600.ms,
                        duration: 600.ms,
                        curve: Curves.easeInOut,
                      )
                ],
              ),
              const Gap(5),
              Column(
                children: [
                  ...ctl.souscriptionsEnCours.map(
                    (e) => CardSuscribe(
                      e,
                      value: e.tauxCotisation,
                    ),
                  ),
                ]
                    .animate(interval: 500.ms)
                    .slideX(delay: NumDurationExtensions(1).seconds)
                    .fade(),
              )
            ],
          ),
        );
      },
    );
  }
}
