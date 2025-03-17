import 'package:dabata_mobile/api/paiement_api_ctl.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

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
    print("user ${user.toJson()}  user id ${user.id}");
    var res = await PaiementApiCtl.getAllUserpayment(user.id.toString());
    if (res.status) {
      isLoading = false;
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
