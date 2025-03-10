import 'package:dabata_mobile/models/categorie.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';

abstract class CategorieApiClt {
  static Future<DataResponse<List<Categorie>>> getAllCategories() async {
    //print("getAllCategories");
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/categories',
        options: Options(headers: WebConst.headers),
      );
      if (res.statusCode == 200) {
        //print("categories ${res.data!.map((e) => e.toString())}");
        return DataResponse.success(
            data:
                (res.data as List).map((e) => Categorie.fromJson(e)).toList());
      }
      return DataResponse.error(systemError: res.data);
    } on DioException catch (e, st) {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
        return DataResponse.error(
            message: "Aucune categorie trouvée.",
            systemError: e,
            systemtraceError: st);
      } else {
        return DataResponse.error(systemError: e, systemtraceError: st);
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }
}
