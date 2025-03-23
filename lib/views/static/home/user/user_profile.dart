import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/views/controllers/home/user/user_profile_vctl.dart';
import 'package:dabata_mobile/views/static/home/user/payer_ma_cotisation.dart';
import 'package:dabata_mobile/views/static/home/user/update_user_password.dart';
import 'package:dabata_mobile/views/static/home/user/update_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  final bool isUserView;

  const UserProfile({
    super.key,
    this.isUserView = true,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileVctl>(
      init: UserProfileVctl(),
      builder: (ctl) {
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
                      title: Text(
                        "Nom: ${ctl.user!.nom.defaultValue("Aucun nom")}",
                      ),
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
                      leading:
                          Image.asset("assets/icons/user2.png", height: 30),
                      title: Text(
                        "Prénom: ${ctl.user!.prenom.defaultValue("Aucun prénom")}",
                      ),
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
                      title: Text(
                        "Telephone: ${ctl.user!.telephone.defaultValue("Aucun numéro de tel")}",
                      ),
                    ),
                  ),
                ),
                const Gap(30),
                Column(
                  children: [
                    CButton(
                      height: 50,
                      minWidth: double.infinity,
                      onPressed: () =>
                          Get.to(() => UpdateUserProfile(ctl.user!)),
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
                        onPressed: () => ctl.logout(),
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
                        onPressed: () =>
                            Get.to(() => const PayerMaCotisation()),
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
      },
    );
  }
}
