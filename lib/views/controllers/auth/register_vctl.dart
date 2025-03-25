import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterVctl extends AuthViewController {
  var nom = TextEditingController();
  var email = TextEditingController();
  var prenom = TextEditingController();
  var password = TextEditingController();
  var telephone = TextEditingController();
  var lieuResidence = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var isObscureText = true;
  final bool withReturn;

  RegisterVctl({this.withReturn = false});

  toggleObscureText() {
    isObscureText = !isObscureText;
    update();
  }

  Future<void> submit({bool withReturn = false}) async {
    if (formKey.currentState!.validate()) {
      var res = await UserApiCtl.register(
        User(
          nom: nom.text,
          email: email.text,
          prenom: prenom.text,
          password: password.text,
          telephone: telephone.text,
          lieuResidence: lieuResidence.text,
        ),
      ).load();

      if (res.status) {
        var resLogin = await UserApiCtl.login(
          email: email.text,
          password: password.text,
        ).load();
        if (resLogin.status) {
          authUser = resLogin.data;
          if (withReturn) {
            Get.back(result: authUser!);
          } else {
            if (authUser?.user?.isAdmin == true) {
              Get.offAll(() => const AdminDashboard());
            } else {
              Get.offAll(() => const Dashboard());
            }
          }
        } else {
          CAlertDialog.show(message: resLogin.message);
        }
      } else {
        CAlertDialog.show(message: res.message);
      }
    }
  }
}
