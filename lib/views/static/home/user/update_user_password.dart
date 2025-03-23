import 'package:dabata_mobile/tools/widgets/inputs/buttons/c_button.dart';
import 'package:dabata_mobile/tools/widgets/inputs/c_text_form_field.dart';
import 'package:dabata_mobile/views/controllers/home/user/update_user_password_vctl.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class UpdateUserPassword extends StatelessWidget {
  const UpdateUserPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateUserPasswordVctl>(
      init: UpdateUserPasswordVctl(),
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Mettre à jour mon mot de passe"),
          ),
          body: Form(
            key: ctl.formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                Lottie.asset("assets/lotties/password.json", height: 150),
                const Gap(20),
                CTextFormField(
                  controller: ctl.oldPassword,
                  require: true,
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Ancien mot de passe",
                ),
                const Gap(10),
                CTextFormField(
                  controller: ctl.newPassword,
                  require: true,
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Nouveau mot de passe",
                ),
                const Gap(10),
                CTextFormField(
                  controller: ctl.confirmPassword,
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Confirmer le nouveau mot de passe",
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Ce champ est obligatoire";
                    }
                    if (e != ctl.newPassword.text) {
                      return "Les mots de passe ne sont pas identiques";
                    }
                    return null;
                  },
                ),
                const Gap(10),
                CButton(
                  onPressed: ctl.submit,
                  child: const Text("Mettre à jour"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
