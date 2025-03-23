import 'package:dabata_mobile/api/paiement_api_ctl.dart';
import 'package:dabata_mobile/models/paiement.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/extensions/types/future.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';

class VoirMesCotisationsVctl extends AuthViewController {
  List<Paiement> paiements = [];
  int souscriptionId;
  DateTime selectedDate = DateTime.now();

  VoirMesCotisationsVctl(this.souscriptionId);

  Future<void> getPaiements() async {
    var res = await PaiementApiCtl.getPaiementsFromSouscription(souscriptionId)
        .load();
    if (res.status) {
      paiements = res.data!;
      update();
    } else {
      CAlertDialog.show(message: res.message);
    }
  }

  @override
  void onReady() {
    getPaiements();
    super.onReady();
  }
}
