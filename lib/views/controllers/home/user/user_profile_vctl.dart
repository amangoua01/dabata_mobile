import 'package:dabata_mobile/tools/alert_widgets/c_choice_message_dialog.dart';
import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/views/static/home/card_pages/card_liste_page.dart';
import 'package:get/get.dart';

class UserProfileVctl extends GetxController {
  Future<void> logout() async {
    CChoiceMessageDialog.show(
      title: "Déconnexion",
      message: "Voulez-vous vraiment vous déconnecter?",
      validText: "Oui",
      cancelText: "Non",
    ).then((confirmed) {
      if (confirmed == true) {
        Cache.clear();
        Get.offAll(() => const CardListePage());
      }
    });
  }
}
