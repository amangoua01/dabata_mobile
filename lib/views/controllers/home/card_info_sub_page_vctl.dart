import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:dabata_mobile/models/auth_user.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_choice_message_dialog.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_snackbar.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/auth/auth_page.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:get/get.dart';

class CardInfoSubPageVctl extends AuthViewController {
  Future<void> cardSuscribing(Carte cache) async {
    if (authUser != null) {
      var rep = await CChoiceMessageDialog.show(
          message: "Voulez-vous vraiment souscrire à cette carte ?");
      if (rep == true) {
        var res = await SouscriptionApiCtl.cardSuscribe(
          cache.id.value,
          authUser!.user!.id.value,
        ).load();
        if (res.status) {
          Get.offAll(() => const Dashboard());
          CSnackbar.show(
            message:
                "Vous venez de souscrire à la carte ${cache.libelle.value}.",
          );
        } else {
          CAlertDialog.show(message: res.message);
        }
      }
    } else {
      var res = await Get.to(() => const AuthPage(withReturn: true));
      if (res is AuthUser) {
        authUser = res;
        CSnackbar.show(
          message: "Vous êtes maintenant connecté"
              " en tant que ${res.user!.fullname.value}",
        );
        update();
      }
    }
  }
}
