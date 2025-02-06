import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/views/static/home/user/update_user_password.dart';
import 'package:dabata_mobile/views/static/home/user/update_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

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
                    color: Colors.grey.shade200, shape: BoxShape.circle)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Nom complet: Haris Dabata"),
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
                onPressed: () async {}, child: const Text("Fermer le compte")),
            Gap(10.h),
            CButton(
                onPressed: () {},
                child: const Text("Faire un paiement de cotisation")),
          ],
        ),
      ),
    );
  }
}
