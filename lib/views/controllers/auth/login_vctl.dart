import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginVctl extends AuthViewController {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool hidePass = true;
  final bool withReturn;

  LoginVctl({required this.withReturn});

  void submit() async {
    if (formKey.currentState!.validate()) {
      var res = await UserApiCtl.login(
        email: emailController.text,
        password: passwordController.text,
      ).load();
      if (res.status) {
        authUser = res.data;
        WebConst.jwt = authUser!.jwt.value;
        if (authUser?.user?.isAdmin == true) {
          Get.offAll(() => const AdminDashboard());
        } else {
          if (withReturn) {
            Get.back(result: authUser!);
          } else {
            Get.offAll(() => const Dashboard());
          }
        }
      } else {
        CAlertDialog.show(message: res.message);
      }
    }
  }
}
