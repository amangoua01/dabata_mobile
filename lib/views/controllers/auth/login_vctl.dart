import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';
import 'package:dabata_mobile/views/static/home/dashboard/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginVctl extends GetxController {
  final formKey = GlobalKey<FormState>();

  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  var getUserConnected = User();

  bool isAdmin = false;
  bool isLoading = false;

  void submit(User user) async {
    var res = await UserApiCtl.login(user).load();
    if (res.status) {
      getUserConnected = res.data!;
      Get.put(getUserConnected, permanent: true);

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
    } else {
      Get.snackbar(
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 4),
        'Connexion echoué',
        res.message,
        titleText: const Text(
          'Connexion echoué',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        messageText: Text(
          res.message,
          style: const TextStyle(
              //color: Colors.red,
              ),
        ),
      );
    }
  }
}
