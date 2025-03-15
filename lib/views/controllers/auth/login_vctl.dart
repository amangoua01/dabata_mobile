import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/views/static/home/dashboard/home.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';

class LoginVctl extends GetxController {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: 'yve@gmail.com');
  var passwordController = TextEditingController(text: '12345678');
  var getUserConnected = User();
  bool isAdmin = false;

  void submit(User user) async {
    var res = await UserApiCtl.login(user);
    if (res.status) {
      //print('ressssssssssssss ${res.data!.roles.map((e) => e.toJson())}');
      //print('getUserConnected ${getUserConnected.toJson()}');
      //print("userConnectedId ${userConnected.toJson()}");
      getUserConnected = res.data!;
      var userConnected = Get.put(getUserConnected, permanent: true);

      for (var role in res.data!.roles) {
        print('ROLESS ${role.libelle}');

        if (role.libelle == 'ROLE_ADMIN') {
          print(role.libelle);
          isAdmin = true;
          break;
        }
      }

      if (isAdmin) {
        Get.offAll(() => const AdminDashboard());
      } else {
        Get.offAll(() => const Home());
      }
    }
  }
}
