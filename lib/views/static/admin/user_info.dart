import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/views/static/home/user/payer_ma_cotisation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const Gap(30),
            Container(
              height: 100.h,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200, shape: BoxShape.circle),
              child: const Icon(Icons.person, size: 50),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text("Nom complet: ${user.fullname}"),
                ),
              ),
            ),
            /*  Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Prénom: Dabata"),
                ),
              ),
            ), */
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Text("Date inscription: 01/01/2023"),
                ),
              ),
            ),
            const Gap(30),
            CButton(
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/close.png",
                    height: 20,
                    color: Colors.white,
                  ),
                  const Gap(5),
                  const Text("Fermer le compte"),
                ],
              ),
            ),
            Gap(10.h),
            CButton(
                onPressed: () => Get.to(() => PayerMaCotisation(user: user)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/payer2.png",
                      height: 20,
                      color: Colors.white,
                    ),
                    const Gap(5),
                    const Text("Faire un paiement de cotisation"),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
