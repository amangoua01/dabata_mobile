import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/views/static/home/dashboard/home.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';

class LoginVctl extends GetxController {
  final formKey = GlobalKey<FormState>();

  var passwordController = TextEditingController(text: '12345678');
  var emailController =
      TextEditingController(text: 'pelletier.isaac@dbmail.com');

  var getUserConnected = User();

  bool isAdmin = false;
  bool isLoading = false;

  void submit(User user) async {
    isLoading = true;
    update();

    var res = await UserApiCtl.login(user);
    if (res.status) {
      isLoading = false;
      getUserConnected = res.data!;
      var userConnected = Get.put(getUserConnected, permanent: true);

      update();

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
