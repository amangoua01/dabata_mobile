import 'package:dabata_mobile/api/paiement_api_ctl.dart';
import 'package:dabata_mobile/models/paiement.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';

class HistoricSubPageVctl extends AuthViewController {
  List<Paiement> paiements = [];
  bool isLoading = true;

  Future<void> getPaiements() async {
    isLoading = true;
    update();
    var res = await PaiementApiCtl.getAllUserpayment(user!.id.value);
    isLoading = false;
    update();
    if (res.status) {
      paiements = res.data!;
      update();
    } else {
      CAlertDialog.show(message: res.message);
    }
  }

  @override
  void onReady() {
    super.onReady();
    getPaiements();
  }
}
