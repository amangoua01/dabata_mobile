import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/views/static/home/user/user_card_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CardSuscribe extends StatelessWidget {
  final Carte carte;
  final double value;
  const CardSuscribe(
    this.carte, {
    this.value = 0.9,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => UserCardDetailPage(carte)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 100.h,
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
                          fontSize: 13.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gap(5.h),
                      Column(
                        children: [
                          SizedBox(
                            height: 7,
                            width: double.infinity,
                            child: LinearProgressIndicator(
                              value: value,
                              borderRadius: BorderRadius.circular(10),
                              backgroundColor: Colors.grey.shade200,
                              valueColor: value <= 0.4
                                  ? const AlwaysStoppedAnimation<Color>(
                                      Colors.red)
                                  : value <= 0.6
                                      ? const AlwaysStoppedAnimation<Color>(
                                          Colors.orange)
                                      : value <= 0.8
                                          ? const AlwaysStoppedAnimation<Color>(
                                              Colors.yellow)
                                          : value <= 1.0
                                              ? const AlwaysStoppedAnimation<
                                                  Color>(Colors.green)
                                              : const AlwaysStoppedAnimation<
                                                  Color>(Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Gap(5.h),
                      Text(
                        "total à payer: ${2000.toAmount()}",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(10.w),
              SizedBox(
                //height: 100.h,
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
