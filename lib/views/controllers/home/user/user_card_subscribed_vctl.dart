import 'package:dabata_mobile/api/paiement_api_ctl.dart';
import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:dabata_mobile/models/paiement.dart';
import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:get/get.dart';

class UserCardSubscribedVctl extends GetxController {
  final User user;
  UserCardSubscribedVctl({required this.user});

  bool isLoading = false;
  List<Paiement> paiements = [];
  List<Souscription> souscriptions = [];

  List<Souscription> get getAllCard => souscriptions;
  List<Souscription> get allcardGetted => getAllCard;

  Future<void> userCardSubscribed() async {
    isLoading = true;
    update();

    var res = await SouscriptionApiCtl.getUserSubscrition(user.id.value);
    if (res.status) {
      isLoading = false;
      souscriptions = res.data!;
      update();
    }
  }

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
    userCardSubscribed();
  }
}
