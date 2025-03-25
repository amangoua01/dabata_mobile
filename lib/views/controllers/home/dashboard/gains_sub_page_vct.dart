import 'package:dabata_mobile/api/cumule_article_api_ctl.dart';
import 'package:dabata_mobile/models/cumule_articles.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';

class GainsSubPageVctl extends AuthViewController {
  List<CumuleArticles> gainsCumules = [];
  bool isLoading = false;

  Future<void> getGainsCumules() async {
    isLoading = true;
    update();

    final DataResponse<List<CumuleArticles>> res;
    if (authUser?.user?.isAdmin == true) {
      res = await CumuleArticleApiCtl.cumuleArticleForAdmin();
    } else {
      res = await CumuleArticleApiCtl.cumuleArticleForUser();
    }
    isLoading = false;
    update();
    if (res.status) {
      gainsCumules = res.data!;
      update();
    } else {
      CAlertDialog.show(message: res.message);
    }
  }

  @override
  void onReady() {
    super.onReady();
    getGainsCumules();
  }
}
