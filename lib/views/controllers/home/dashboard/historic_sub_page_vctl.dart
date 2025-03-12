import 'package:dabata_mobile/api/paiement_api_ctl.dart';
import 'package:dabata_mobile/models/paiement.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:get/get.dart';

class HistoricSubPageVctl extends GetxController {
  var user = Get.find<User>();

  List<Paiement> paiements = [];

  Future<void> getPaiements() async {
    var res = await PaiementApiCtl.getAllUserpayment(user.id.toString());
    if (res.status) {
      paiements = res.data!;
      print("paiements ${paiements.map((p) => p.toJson())}");
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getPaiements();
  }
}
