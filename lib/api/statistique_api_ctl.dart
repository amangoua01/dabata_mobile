import 'package:dabata_mobile/models/carte_stats.dart';
import 'package:dabata_mobile/models/montant_souscrit_stats.dart';
import 'package:dabata_mobile/models/users_and_subscription_stat.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';

abstract class StatistiqueApiCtl {
// ALL STAT API FOR ADMIN
  static Future<DataResponse<List<UsersAndSubscriptionStat>>>
      getStatistique() async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/statistiques/admin/by-user-stat',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        //print("stats ${res.data['hydra:member']}");
        return DataResponse.success(
            data: (res.data['hydra:member'] as List)
                .map((e) => UsersAndSubscriptionStat.fromJson(e))
                .toList());
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } on DioException catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static Future<DataResponse<List<CarteStats>>>
      getAllSubcriptionByCard() async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/statistiques/admin/souscriptions-by-carte',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(
          data: (res.data as List).map((e) => CarteStats.fromJson(e)).toList(),
        );
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } on DioException catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static Future<DataResponse<List<MontantSouscritStats>>>
      getAllSubcriptionByAmountType() async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/statistiques/admin/souscriptions-by-montant',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(
            data: (res.data as List)
                .map((e) => MontantSouscritStats.fromJson(e))
                .toList());
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } on DioException catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static Future<DataResponse<List<MontantSouscritStats>>>
      getAllSubcriptionByAmountTypeForUser() async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/statistiques/user/souscriptions-by-montant',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        //print("amount stats ${res.data}");
        return DataResponse.success(
            data: (res.data as List)
                .map((e) => MontantSouscritStats.fromJson(e))
                .toList());
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
