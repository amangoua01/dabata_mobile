import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/views/static/auth/auth_page.dart';
import 'package:get/get.dart';

class UserProfileVctl extends GetxController {
  Future<void> logout() async {
    Get.offAll(() => const AuthPage());
    Cache.clear();
  }
}
