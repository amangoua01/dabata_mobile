import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/role.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/api/login_api_ctl.dart';
import 'package:dabata_mobile/views/static/home/dashboard/home.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';

class LoginVctl extends GetxController {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  //var userConnected = User();

  void submit(User user) async {
    var res = await LoginApiCtl.login(user);
    if (res.status) {
      //print('ressssssssssssss ${res.data!.toJson()}');

      //userConnected = Get.put(User.fromJson(res.data!.toJson()));
      //print('userConnected ${userConnected.toJson()}');
      //print('isAdmin ${res.data!.roles.contains(Roles.fromJson('ROLE_ADMIN'))}');
      if (res.data!.roles.contains(Roles.fromJson('ROLE_ADMIN'))) {
        Get.to(() => const AdminDashboard());
      } else {
        Get.to(() => const Home());
      }
    }
  }
}
