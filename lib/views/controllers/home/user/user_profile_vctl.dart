import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_choice_message_dialog.dart';
import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:get/get.dart';

class UserProfileVctl extends AuthViewController {
  Future<void> getUser() async {
    var res = await UserApiCtl.getUser(authUser!.user!.uuId!);
    if (res.status) {
      authUser!.user = res.data;
      update();
    }
  }

  @override
  Future<void> logout() async {
    CChoiceMessageDialog.show(
      message: "Voulez-vous vraiment vous déconnecter?",
    ).then((confirmed) {
      if (confirmed == true) {
        Cache.clear();
        WebConst.jwt = "";
        Get.deleteAll(force: true);
        Get.offAll(() => const CardListePage());
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    getUser();
  }
}
