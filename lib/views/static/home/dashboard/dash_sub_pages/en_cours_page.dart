import 'package:dabata_mobile/tools/components/c_card.dart';
import 'package:dabata_mobile/tools/components/card_suscribe.dart';
import 'package:dabata_mobile/tools/widgets/empty_list_content.dart';
import 'package:dabata_mobile/tools/widgets/placeholder_widget.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/dashboard_sub_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class EnCoursPage extends StatelessWidget {
  final DashboardSubPageVctl ctl;
  const EnCoursPage(this.ctl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: RefreshIndicator(
        onRefresh: ctl.getUserAllSubscriptionCard,
        child: PlaceHolderWidget(
          condition: !ctl.isLoading,
          placeholder: const Center(child: CircularProgressIndicator()),
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
                        delay: 10.ms,
                        duration: 250.ms,
                        curve: Curves.easeInOut,
                      ),
                  CCard(
                    title: "Montant total",
                    amount: ctl.totalAmount.toInt(),
                    unite: "F",
                  ).animate().flip(
                        delay: 10.ms,
                        duration: 100.ms,
                        curve: Curves.easeInOut,
                      )
                ],
              ),
              PlaceHolderWidget(
                condition: ctl.souscriptionsEnCours.isNotEmpty,
                placeholder: const Column(
                  children: [
                    Gap(150),
                    EmptyListContent(
                      emptyText: "Aucune souscription en cours",
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Gap(5),
                    ...ctl.souscriptionsEnCours.map(
                      (e) => CardSuscribe(
                        e,
                        value: e.tauxCotisation,
                      ),
                    ),
                  ]
                      .animate(interval: 50.ms)
                      .slideX(delay: NumDurationExtensions(1).seconds)
                      .fade(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
