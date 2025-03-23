import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard/admin_dashboard.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:get/get.dart';

class SplashScreenPageVctl extends AuthViewController {
  redirect() async {
    var cachedUser = await getUserFromCache();
    if (cachedUser != null) {
      if (cachedUser.user?.isAdmin == true) {
        Get.off(() => const AdminDashboard());
      } else {
        Get.off(() => const Dashboard());
      }
    } else {
      Get.off(() => const CardListePage());
    }
  }

  @override
  void onReady() {
    redirect();
    super.onReady();
  }
}
