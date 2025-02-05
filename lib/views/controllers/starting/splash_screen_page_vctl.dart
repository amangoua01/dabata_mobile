import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:get/get.dart';

class SplashScreenPageVctl extends GetxController {
  redirect() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => const CardListePage());
  }

  @override
  void onReady() {
    redirect();
    super.onReady();
  }
}
