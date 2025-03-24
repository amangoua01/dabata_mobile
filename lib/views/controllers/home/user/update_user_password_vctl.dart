import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_snackbar.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateUserPasswordVctl extends GetxController {
  var formKey = GlobalKey<FormState>();
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();
  bool obscureText = true;

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      var res = await UserApiCtl.updatePassword(
        oldPassword: oldPassword.text,
        newPassword: newPassword.text,
      ).load();
      if (res.status) {
        Get.back();
        CSnackbar.show(message: "Mot de passe modifié avec succès.");
      } else {
        CAlertDialog.show(message: res.message);
      }
    }
  }
}
