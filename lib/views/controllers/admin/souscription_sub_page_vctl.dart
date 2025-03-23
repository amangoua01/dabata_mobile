import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:dabata_mobile/models/souscription.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SouscriptionSubPageVctl extends GetxController {
  List<Souscription> souscriptions = [];
  bool isLoading = false;

  Future<void> getSouscriptions() async {
    isLoading = true;
    update();

    var res = await SouscriptionApiCtl.getAll();
    if (res.status) {
      isLoading = false;
      souscriptions = res.data!;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getSouscriptions();
  }
}
