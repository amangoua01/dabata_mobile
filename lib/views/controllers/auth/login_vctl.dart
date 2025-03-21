import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';
import 'package:dabata_mobile/views/static/home/dashboard/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginVctl extends AuthViewController {
  final formKey = GlobalKey<FormState>();

  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  bool isAdmin = false;
  bool isLoading = false;

  void submit() async {
    var res = await UserApiCtl.login(
      email: emailController.text,
      password: passwordController.text,
    ).load();
    if (res.status) {
      authUser = res.data;
      update();
      if (authUser?.user?.isAdmin == true) {
        Get.offAll(() => const AdminDashboard());
      } else {
        Get.offAll(() => const Home());
      }
      // for (var role in res.data!.user!.roles) {
      //   print('ROLESS ${role.libelle}');

      //   if (role.libelle == 'ROLE_ADMIN') {
      //     print(role.libelle);
      //     isAdmin = true;
      //     break;
      //   }
      // }
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
