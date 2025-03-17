import 'package:dabata_mobile/api/paiement_api_ctl.dart';
import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/models/paiement.dart';
import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:get/get.dart';

class UserCardSubscribedVctl extends GetxController {
  final User user;
  UserCardSubscribedVctl({required this.user});

  bool isLoading = false;
  List<Paiement> paiements = [];
  List<Souscription> souscriptions = [];

  List<Souscription> get getAllCard => souscriptions;
  List<Carte> get allcardGetted => getAllCard.map((s) => s.carte!).toList();

  Future<void> userCardSubscribed() async {
    isLoading = true;
    update();

    var res = await SouscriptionApiCtl.getUserSubscrition(user.id.toString());
    if (res.status) {
      isLoading = false;
      print("cartes ${res.data!.map((e) => e.toJson())}");
      souscriptions = res.data!;
      update();
    }
  }

  Future<void> getPaiements() async {
    isLoading = true;
    update();

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
    userCardSubscribed();
  }
}
