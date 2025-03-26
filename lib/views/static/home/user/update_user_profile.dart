import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:dabata_mobile/views/controllers/home/user/update_user_vctl.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';

class UpdateUserProfile extends StatelessWidget {
  final User user;
  const UpdateUserProfile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    //print("update user profile ${user.toJson()}");
    return GetBuilder<UpdateUserVctl>(
        init: UpdateUserVctl(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Mettre à jour mon profile"),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: ListView(
                  children: [
                    Lottie.asset(
                      "assets/lotties/profile.json",
                      height: 150,
                    ),
                    CTextFormField(
                      hintText: "Nom",
                      controller: ctl.nom,
                      labelText: user.nom ?? "Nom",
                    ),
                    const Gap(10),
                    CTextFormField(
                      hintText: "Prénom(s)",
                      controller: ctl.prenom,
                      labelText: user.prenom ?? "Prénom(s)",
                    ),
                    const Gap(10),
                    CTextFormField(
                      maxLength: 10,
                      hintText: "Téléphone",
                      controller: ctl.telephone,
                      labelText: user.telephone ?? "Téléphone",
                    ),
                    const Gap(10),
                    CTextFormField(
                      hintText: "Email",
                      controller: ctl.email,
                      labelText: user.email ?? "Email",
                    ),
                    const Gap(10),
                    CTextFormField(
                      hintText: "Lieu de résidence",
                      controller: ctl.lieuResidence,
                      labelText: user.lieuResidence ?? "Lieu de résidence",
                    ),
                    const Gap(20),
                    CButton(
                      onPressed: () {
                        //ctl.updateUser;

                        var res = ctl.updateUser();
                        //print("res $res");
                        /* if (res != null) {
                         
                        } */
                      },
                      child: const Text("Mettre à jour"),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
