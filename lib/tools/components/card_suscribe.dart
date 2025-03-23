import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/placeholder_widget.dart';
import 'package:dabata_mobile/views/static/home/user/user_card_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CardSuscribe extends StatelessWidget {
  final Souscription souscription;
  final bool withUser;
  final double value;
  const CardSuscribe(
    this.souscription, {
    this.value = 0,
    this.withUser = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => UserCardDetailPage(souscription)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: SizedBox(
          height: (withUser) ? 130 : 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 0.8,
                      ),
                    ),
                    height: 60.h,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        souscription.carte!.image,
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
                      PlaceHolderWidget(
                        condition: withUser,
                        child: Text(
                          souscription.user!.fullname.value,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Text(
                        souscription.carte!.libelle ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gap(2.h),
                      Text(
                        souscription.carte!.categorie?.libelle ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.grey.shade600,
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
                              valueColor: value <= 0.33
                                  ? const AlwaysStoppedAnimation<Color>(
                                      Colors.red)
                                  : value <= 0.66
                                      ? const AlwaysStoppedAnimation<Color>(
                                          Colors.orange)
                                      : const AlwaysStoppedAnimation<Color>(
                                          Colors.green),
                            ),
                          ),
                        ],
                      ),
                      Gap(5.h),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons/porte_monaie.gif",
                                  width: 15,
                                ),
                                const Gap(5),
                                Text(
                                  souscription.montantCotise
                                      .toAmount(devise: "F"),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: value <= 0.33
                                        ? Colors.red
                                        : value <= 0.66
                                            ? Colors.orange
                                            : Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                souscription.carte!.montantTotal != null
                                    ? souscription.carte!.montantTotal!
                                        .toAmount(devise: "F")
                                    : "0 F",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(5),
                              Image.asset(
                                "assets/icons/emballage.png",
                                width: 15,
                              ),
                            ],
                          ),
                        ],
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
