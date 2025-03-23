import 'package:dabata_mobile/api/paiement_api_ctl.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:get/get.dart';

import '../../../../models/paiement.dart';
import '../../../../models/users.dart';

class UserHistoricSubPageVctl extends GetxController {
  final User user;
  UserHistoricSubPageVctl({required this.user});

  bool isLoading = false;

  List<Paiement> paiements = [];

  Future<void> getPaiements() async {
    isLoading = true;
    update();

    var res = await PaiementApiCtl.getAllUserpayment(user.id.value);
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
