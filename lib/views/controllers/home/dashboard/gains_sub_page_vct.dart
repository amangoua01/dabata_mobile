import 'package:dabata_mobile/api/cumule_article_api_ctl.dart';
import 'package:dabata_mobile/models/cumule_articles.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GainsSubPageVctl extends GetxController {
  List<CumuleArticles> gainsCumules = [];
  bool isLoading = false;

  Future<void> getGainsCumules() async {
    isLoading = true;
    update();

    var res = await CumuleArticleApiCtl.cumuleArticleForUser();
    if (res.status) {
      isLoading = false;
      gainsCumules = res.data!;
      print("cumules gains du user ${gainsCumules.map((e) => e.toJson())}");
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getGainsCumules();
  }
}
