import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dabata_mobile/views/static/home/dashboard/home.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LoginVctl extends GetxController {
  final formKey = GlobalKey<FormState>();

  var passwordController = TextEditingController(text: '12345678');
  var emailController =
      TextEditingController(text: 'pelletier.isaac@dbmail.com');

  var getUserConnected = User();

  bool isAdmin = false;
  bool isLoading = false;

  void submit(User user) async {
    EasyLoading.show(
      dismissOnTap: false,
      status: 'Connexion en cours...',
      maskType: EasyLoadingMaskType.black,
      indicator: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );

    var res = await UserApiCtl.login(user);
    if (res.status) {
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
        EasyLoading.dismiss();

        Get.offAll(() => const AdminDashboard());
      } else {
        EasyLoading.dismiss();

        Get.offAll(() => const Home());
      }
    } else {
      EasyLoading.dismiss();
      Get.snackbar(
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
