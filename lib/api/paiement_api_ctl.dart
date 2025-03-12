import 'package:dabata_mobile/models/paiement.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';

abstract class PaiementApiCtl {
  static Future<DataResponse<List<Paiement>>> getAllUserpayment(
      String userId) async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/paiements?user=$userId',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(
            data: (res.data as List).map((e) => Paiement.fromJson(e)).toList());
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } on DioException catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }
}
