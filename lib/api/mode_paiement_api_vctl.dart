import 'package:dabata_mobile/models/mode_paiement.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';

abstract class ModePaiementApiVctl {
  static Future<DataResponse<List<ModePaiement>>> getAll() async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/mode_paiements',
        options: Options(headers: WebConst.authHeaders),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(
            data: (res.data as List)
                .map((e) => ModePaiement.fromJson(e))
                .toList());
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }
}
