import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/views/static/home/user/update_user_password.dart';
import 'package:dabata_mobile/views/static/home/user/update_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Nom: Dabata"),
                ),
              ),
            ),
            Padding(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Telephone: 07 00 00 00 00"),
                ),
              ),
            ),
            const Gap(30),
            CButton(
                onPressed: () async {
                  var result = await Get.to(() => const UpdateUserProfile());

                  /* if(result != null){
                  print(result);
                } */
                },
                child: const Text("Mettre à jour mon profile")),
            CButton(
                onPressed: () => Get.to(() => const UpdateUserPassword()),
                child: const Text("Changer mon mot de passe")),
          ],
        ),
      ),
    );
  }
}
