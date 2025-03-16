import 'package:dabata_mobile/models/cumule_articles.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';

abstract class CumuleArticleApiCtl {
  static Future<DataResponse<List<CumuleArticles>>> cumuleArticle() async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/gains/admin/articles-cumules',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        //print("cumules ${res.data}");
        return DataResponse.success(
            data: (res.data as List)
                .map((e) => CumuleArticles.fromJson(e))
                .toList());
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } catch (e) {
      return DataResponse.error(systemError: e);
    }
  }
}
