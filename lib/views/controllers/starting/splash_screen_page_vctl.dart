import 'package:dabata_mobile/models/auth_user.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:get/get.dart';

class SplashScreenPageVctl extends AuthViewController {
  redirect() async {
    var cachedUser = await getUserFromCache();
    if (cachedUser != null) {
      if (WebConst.tokenIsValid(cachedUser.jwt.value)) {
        WebConst.jwt = cachedUser.jwt.value;
        _goToHome(cachedUser);
      } else {
        var res = await WebConst.refreshToken();
        if (res.status) {
          cachedUser.jwt = res.data;
          refreshAuthUser(authUser);
          _goToHome(cachedUser);
        } else {
          await logout();
          Get.off(() => const CardListePage());
        }
      }
    } else {
      Get.off(() => const CardListePage());
    }
  }

  _goToHome(AuthUser cachedUser) {
    if (cachedUser.user?.isAdmin == true) {
      Get.off(() => const AdminDashboard());
    } else {
      Get.off(() => const Dashboard());
    }
  }

  @override
  void onReady() {
    redirect();
    super.onReady();
  }
}
