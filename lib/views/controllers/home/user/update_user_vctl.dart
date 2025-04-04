import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    var updatedUser = User(
      uuId: user?.uuId,
      nom: nom.text,
      email: email.text,
      prenom: prenom.text,
      telephone: telephone.text,
      lieuResidence: lieuResidence.text,
    );

    var res = await UserApiCtl.updateUser(updatedUser).load();

    if (res.status) {
      authUser!.user = res.data!;
      refreshAuthUser(authUser);
      Get.back(result: res.data);
    } else {
      CAlertDialog.show(message: res.message);
    }
  }
}
