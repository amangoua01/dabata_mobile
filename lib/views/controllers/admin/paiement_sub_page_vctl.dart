import 'package:dabata_mobile/api/paiement_api_ctl.dart';
import 'package:dabata_mobile/models/paiement.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PaiementSubPageVctl extends GetxController {
  List<Paiement> paiements = [];
  bool isLoading = false;

  Future<void> getPaiements() async {
    isLoading = true;
    update();
    var res = await PaiementApiCtl.getAllUserpaymentList();
    isLoading = false;
    update();
    if (res.status) {
      paiements = res.data!;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getPaiements();
  }
}
