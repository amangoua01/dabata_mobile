import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';

abstract class CarteApiCtl {
  static Future<DataResponse<List<Carte>>> getCartes() async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/cartes',
        options: Options(headers: WebConst.headers),
      );
      if (res.statusCode == 200) {
        //print('cartes ${res.data!}');
        return DataResponse.success(
            data: (res.data as List).map((e) => Carte.fromJson(e)).toList());
      }
      return DataResponse.error(systemError: res.data);
    } on DioException catch (e, st) {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
        return DataResponse.error(
            message: "Aucune carte trouvée.",
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
