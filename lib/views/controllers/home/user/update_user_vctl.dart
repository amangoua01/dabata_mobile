import 'package:dabata_mobile/models/auth_user.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';

class UpdateUserVctl extends AuthViewController {
  late TextEditingController nom;
  late TextEditingController email;
  late TextEditingController prenom;
  late TextEditingController telephone;
  late TextEditingController lieuResidence;

  @override
  void onInit() {
    super.onInit();
    nom = TextEditingController(text: authUser!.user!.nom);
    email = TextEditingController(text: authUser!.user!.email);
    prenom = TextEditingController(text: authUser!.user!.prenom);
    telephone = TextEditingController(text: authUser!.user!.telephone);
    lieuResidence = TextEditingController(text: authUser!.user!.lieuResidence);
  }

  // Future<void> updateUser() async {
  //   var res = await UserApiCtl.updateUser(
  //     User(
  //       uuId: authUser!.user!.uuId,
  //       nom: nom.text,
  //       email: email.text,
  //       prenom: prenom.text,
  //       telephone: telephone.text,
  //       lieuResidence: lieuResidence.text,
  //       password: authUser!.user!.password,
  //     ),
  //   ).load();
  //   if (res.status) {
  //     Get.back(result: res.data);
  //   } else {
  //     CAlertDialog.show(message: res.message);
  //   }
  // }
  Future<void> updateUser() async {
    final user = authUser!.user!;

    print("user ${user.toJson()}");

    Map<String, dynamic> updatedFields = {};

    if (nom.text.isNotEmpty && nom.text != user.nom) {
      updatedFields['nom'] = nom.text;
    }
    if (email.text.isNotEmpty && email.text != user.email) {
      updatedFields['email'] = email.text;
    }
    if (prenom.text.isNotEmpty && prenom.text != user.prenom) {
      updatedFields['prenom'] = prenom.text;
    }
    if (telephone.text.isNotEmpty && telephone.text != user.telephone) {
      updatedFields['telephone'] = telephone.text;
    }
    if (lieuResidence.text.isNotEmpty &&
        lieuResidence.text != user.lieuResidence) {
      updatedFields['lieuResidence'] = lieuResidence.text;
    }

    if (updatedFields.isEmpty) {
      CAlertDialog.show(message: "Aucune modification détectée.");
      return;
    }

    print(updatedFields);

    var res = await UserApiCtl.updateUser(
      User(
        uuId: user.uuId,
        nom: updatedFields['nom'] ?? user.nom,
        email: updatedFields['email'] ?? user.email,
        prenom: updatedFields['prenom'] ?? user.prenom,
        telephone: updatedFields['telephone'] ?? user.telephone,
        lieuResidence: updatedFields['lieuResidence'] ?? user.lieuResidence,
      ),
    ).load();

    if (res.status) {
      Get.back(result: res.data);
    } else {
      CAlertDialog.show(message: res.message);
    }
  }
}
