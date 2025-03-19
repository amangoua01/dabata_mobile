import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/views/static/auth/register_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EdtionUserPageVctl extends GetxController {
  var nom = TextEditingController();
  var email = TextEditingController();
  var prenom = TextEditingController();
  var password = TextEditingController();
  var telephone = TextEditingController();
  var lieuResidence = TextEditingController();

  Future<void> submit() async {
    var res = await UserApiCtl.register(
      User(
        nom: nom.text,
        email: email.text,
        prenom: prenom.text,
        password: password.text,
        telephone: telephone.text,
        lieuResidence: lieuResidence.text,
        fullname: '${nom.text} ${prenom.text}',
      ),
    );

    if (res.status) {
      print('res ${res.data!.toJson()}');
      Get.to(() => const RegisterSubPage());
    }
  }
}
