import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:dabata_mobile/views/controllers/home/dashboard/dashboard_vctl.dart';

class SoldePage extends StatelessWidget {
  const SoldePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardVctl>(
      init: DashboardVctl(),
      builder: (ctl) {
        return Container(
            decoration: const BoxDecoration(),
            child: ListView(
              children: ctl.cartesSoldees
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primary.shade100,
                          ),
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  e.libelle ?? 'n/a',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                Gap(10.w),
                                Text(
                                  e.categorie?.libelle ?? 'n/a',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              e.montantJournalier?.toAmount(devise: 'F') ??
                                  'Aucun montant',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            trailing: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: const Icon(
                                Icons.done,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ));
      },
    );
  }
}
