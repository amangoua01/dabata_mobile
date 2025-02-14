import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/views/static/home/user/user_card_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CardSuscribe extends StatelessWidget {
  final Carte carte;
  const CardSuscribe(
    this.carte, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => UserCardDetailPage(carte)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: SizedBox(
          height: 100,
          /* decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 1),
          ), */
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 100.h,
                    //height: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        carte.image.value,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        carte.libelle.value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        carte.categorie!.libelle.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "total à payer: ${2000.toAmount()}",
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // const Gap(10),
                      /* Column(
                        children: [
                          /*  SizedBox(
                            height: 10,
                            width: double.infinity,
                            child: LinearProgressIndicator(
                              value: 0.5,
                              borderRadius: BorderRadius.circular(10),
                              backgroundColor: Colors.grey.shade200,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
                            ),
                          ), */
                          const Gap(5),
                          Row(
                            children: [
                              /*  Expanded(
                                child: /* Text(
                                  "1000".toAmount(),
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ), */
                              ), */
                              Text(
                                "2000".toAmount(),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                     */
                    ],
                  ),
                ),
              ),
              Gap(5.w),
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.info,
                  size: 25,
                  color: AppColors.primary.shade300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
