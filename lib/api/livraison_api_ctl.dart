import 'package:dabata_mobile/models/livraison_date.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';

abstract class LivraisonApiCtl {
  static Future<DataResponse<List<LivraisonDate>>> getLivraisons() async {
    try {
      var res = await WebConst.client.get(
        Const.buildUrl(path: "livraisons"),
        options: Options(headers: WebConst.headers),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(
          data:
              (res.data as List).map((e) => LivraisonDate.fromJson(e)).toList(),
        );
      }
      return DataResponse.error(systemError: res.data);
    } on DioException catch (e, st) {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
        return DataResponse.error(
          message: "Aucune livraison trouvée.",
          systemError: e,
          systemtraceError: st,
        );
      } else {
        return DataResponse.error(systemError: e, systemtraceError: st);
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }
}
