import 'package:dabata_mobile/api/souscription_api_ctl.dart';
import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:get/get.dart';

class CardInfoSubPageVctl extends GetxController {
  var userToken = '';
  Future<void> fetchUserToken() async {
    try {
      var jwt = await Cache.getString('jwt');
      //print('User token: $jwt');
      userToken = jwt!;
      update();
      print("userToken $userToken");
      // Vous pouvez maintenant utiliser userToken ici
    } catch (e) {
      print('Erreur lors de la récupération du token: $e');
    }
  }

  Future<void> cardSuscribing(cardId) async {
    var res = await SouscriptionApiCtl.cardSuscribe(cardId);
    if (res.status) {
      print("souscription ${res.data!.toJson()}");
      Get.to(() => const Dashboard());
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchUserToken();
  }
}
