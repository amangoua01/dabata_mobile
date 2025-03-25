import 'package:dabata_mobile/api/cumule_article_api_ctl.dart';
import 'package:dabata_mobile/models/cumule_articles.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ArticlesSubPageVctl extends GetxController {
  List<CumuleArticles> articlesCumules = [];
  bool isLoading = false;

  Future<void> fetchAllCumuleArticles() async {
    isLoading = true;
    update();

    var res = await CumuleArticleApiCtl.cumuleArticleForAdmin();
    if (res.status) {
      isLoading = false;
      articlesCumules = res.data!;
      print("articles cumules ${articlesCumules.map((e) => e.toJson())}");
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchAllCumuleArticles();
  }
}
