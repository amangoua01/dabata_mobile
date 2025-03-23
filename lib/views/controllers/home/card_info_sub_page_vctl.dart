import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_choice_message_dialog.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_snackbar.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/auth/auth_page.dart';
import 'package:get/get.dart';

class CardInfoSubPageVctl extends AuthViewController {
  Future<void> cardSuscribing(cardId) async {
    if (authUser != null) {
      var rep = await CChoiceMessageDialog.show(
          message: "Voulez-vous vraiment souscrire à cette carte ?");
      if (rep == true) {
        var res = await SouscriptionApiCtl.cardSuscribe(
          cardId,
          authUser!.user!.id.value,
        ).load();
        if (res.status) {
          Get.back(result: res.data!);
        } else {
          CAlertDialog.show(message: res.message);
        }
      }
    } else {
      var res = await Get.to(() => const AuthPage(withReturn: true));
      if (res != null) {
        CSnackbar.show(
          message: "Vous venez de souscrire à la carte avec succès.",
        );
        update();
      }
    }
  }
}
