import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/constants/app_colors.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CardItem extends StatelessWidget {
  final Carte carte;
  const CardItem(this.carte, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => CardDetailPage(carte)),
      child: Container(
        //padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.amber.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.network(
                    carte.image.value,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    carte.libelle.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  /* const Gap(4),
                  Text(
                    carte.categorie!.libelle.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                    ),
                  ), */
                  const Gap(3),
                  Text(
                    "${carte.montantJournalier.toAmount()} / jour",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    'Du ${carte.debut.toFrenchDate}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                  Text(
                    'Au ${carte.fin.toFrenchDate}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
