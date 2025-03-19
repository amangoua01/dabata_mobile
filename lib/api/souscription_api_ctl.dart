import 'package:dio/dio.dart';
import 'package:dabata_mobile/models/souscription.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';

abstract class SouscriptionApiCtl {
  static Future<DataResponse<List<Souscription>>> getAll() async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/souscriptions',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        print("souscriptions ${res.data!.map((e) => e.toString())}");
        return DataResponse.success(
            data: (res.data as List)
                .map((e) => Souscription.fromJson(e))
                .toList());
      }
      return DataResponse.error(systemError: res.data);
    } on DioException catch (e, st) {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
        return DataResponse.error(
            message: "Aucune carte souscrite trouvée.",
            systemError: e,
            systemtraceError: st);
      } else {
        return DataResponse.error(systemError: e, systemtraceError: st);
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static Future<DataResponse<List<Souscription>>> getUserSubscrition(
      String userId) async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/souscriptions?user=$userId',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        //print("souscriptions ${res.data!.map((e) => e.toString())}");
        return DataResponse.success(
            data: (res.data as List)
                .map((e) => Souscription.fromJson(e))
                .toList());
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } on DioException catch (e, st) {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
        return DataResponse.error(
            message: "Aucune carte souscrite trouvée cet utilisateur.",
            systemError: e,
            systemtraceError: st);
      } else {
        return DataResponse.error(systemError: e, systemtraceError: st);
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static Future<DataResponse> cardSuscribe(int id) async {
    try {
      var res = await WebConst.client.post(
        '${Const.baseUrl}/api/souscriptions',
        data: {
          "etat": 2,
          "carte": "/api/cartes/$id",
          "dateLivraison": DateTime.now().toString(),
        },
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(data: Souscription.fromJson(res.data));
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
