import 'package:dabata_mobile/views/static/auth/register_sub_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/api/register_api_ctl.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';

class RegisterVctl extends GetxController {
  var nom = TextEditingController();
  var email = TextEditingController();
  var prenom = TextEditingController();
  var password = TextEditingController();
  var telephone = TextEditingController();
  var lieuResidence = TextEditingController();

  var isObscureText = true;

  toggleObscureText() {
    isObscureText = !isObscureText;
    update();
  }

  Future<void> submit() async {
    var res = await RegisterApiCtl.register(
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
