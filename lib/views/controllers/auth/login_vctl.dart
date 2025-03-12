import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/role.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/views/static/home/dashboard/home.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';

class LoginVctl extends GetxController {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: 'yve@gmail.com');
  var passwordController = TextEditingController(text: '12345678');
  var getUserConnected = User();

  void submit(User user) async {
    var res = await UserApiCtl.login(user);
    if (res.status) {
      //print('ressssssssssssss ${res.data!.toJson()}');
      getUserConnected = res.data!;
      //print('getUserConnected ${getUserConnected.toJson()}');

      var userConnected = Get.put(getUserConnected, permanent: true);
      print("userConnectedId ${userConnected.toJson()}");

      if (res.data!.roles.contains(Roles.fromJson('ROLE_ADMIN'))) {
        Get.to(() => const AdminDashboard());
      } else {
        Get.to(() => const Home());
      }
    }
  }
}
