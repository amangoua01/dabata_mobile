import 'package:dabata_mobile/tools/components/c_list_tile.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/views/controllers/admin/paiement_sub_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PaiementSubPage extends StatelessWidget {
  const PaiementSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaiementSubPageVctl>(
      init: PaiementSubPageVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(title: const Text("Liste des paiements")),
          body: ctl.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    ...ctl.paiements.map((e) => CListTile(
                          leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.primary.shade100,
                              child: Image.asset(
                                "assets/icons/payer.png",
                                height: 30,
                                fit: BoxFit.cover,
                              )),
                          title: Row(
                            children: [
                              Text(e.user!.fullname.value),
                              Gap(10.w),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                  'paiement : ${e.modePaiement!.libelle.value}'),
                              Gap(10.w),
                              Text(e.datePaiement.toFrenchDateTime),
                            ],
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green.shade100,
                            ),
                            child: Text(e.montant.toAmount(devise: "F")),
                          ),
                        ))
                  ],
                ),
        );
      },
    );
  }
}
