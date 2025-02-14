import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/views/static/home/user/payer_ma_cotisation.dart';
import 'package:dabata_mobile/views/static/home/user/update_user_profile.dart';
import 'package:dabata_mobile/views/static/home/user/update_user_password.dart';

class UserProfile extends StatelessWidget {
  final bool isUserView;
  const UserProfile({this.isUserView = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
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
                child: ListTile(
                  leading: Image.asset(
                    "assets/icons/user2.png",
                    height: 30,
                  ),
                  title: const Text("Nom: Dabata"),
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
                child: ListTile(
                  leading: Image.asset("assets/icons/user2.png", height: 30),
                  title: const Text("Prénom: Dabata"),
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
                child: ListTile(
                  leading: Image.asset("assets/icons/tel.png", height: 30),
                  title: const Text("Telephone: 07 00 00 00 00"),
                ),
              ),
            ),
            const Gap(30),
            Column(
              children: [
                CButton(
                  height: 50,
                  minWidth: double.infinity,
                  onPressed: () => Get.to(() => const UpdateUserProfile()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/user2.png",
                        height: 25,
                        color: Colors.white,
                      ),
                      const Gap(10),
                      const Text("Mettre à jour le profil"),
                    ],
                  ),
                ),
                const Gap(10),
                CButton(
                  height: 50,
                  minWidth: double.infinity,
                  onPressed: () => Get.to(() => const UpdateUserPassword()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/password.png",
                        height: 25,
                        color: Colors.white,
                      ),
                      const Gap(10),
                      const Text("Changer mon mot de passe"),
                    ],
                  ),
                ),
                const Gap(10),
              ],
            ),
            Visibility(
              visible: isUserView,
              child: Column(
                children: [
                  CButton(
                    height: 50,
                    color: Colors.red,
                    minWidth: double.infinity,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/logout.png",
                          height: 25,
                          color: Colors.white,
                        ),
                        const Gap(10),
                        const Text("Déconnexion"),
                      ],
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            ),
            Visibility(
              visible: !isUserView,
              child: Column(
                children: [
                  CButton(
                    height: 50,
                    minWidth: double.infinity,
                    onPressed: () => Get.to(() => const PayerMaCotisation()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/argent.png",
                          height: 25,
                          color: Colors.white,
                        ),
                        const Gap(10),
                        const Text("Ajouter un paiement"),
                      ],
                    ),
                  ),
                  const Divider(height: 50),
                  CButton(
                    height: 50,
                    color: Colors.red,
                    minWidth: double.infinity,
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close),
                        Gap(10),
                        Text("Fermer le compte"),
                      ],
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
