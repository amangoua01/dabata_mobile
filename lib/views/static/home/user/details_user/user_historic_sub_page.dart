import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/components/historic_payment_card.dart';
import 'package:dabata_mobile/views/controllers/home/user/user_historic_sub_page_vctl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../tools/constants/app_colors.dart';

class UserHistoricSubPage extends StatelessWidget {
  final User user;

  const UserHistoricSubPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserHistoricSubPageVctl>(
      init: UserHistoricSubPageVctl(user: user),
      builder: (ctl) {
        return ctl.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.primary,
              ))
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      "Mes dernières opérations",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ...ctl.paiements.map((p) => HistoricPaymentCard(
                        amount: p.montant ?? 0,
                        title:
                            'Mode de paiement : ${p.modePaiement?.libelle ?? 'n/a'}',
                        //categorie: p.categorie.libelle,
                        dateTime: p.datePaiement?.toString() ??
                            DateTime.now().toString(),
                      )),
                ],
              );
      },
    );
  }
}
