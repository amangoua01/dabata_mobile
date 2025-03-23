import 'package:dabata_mobile/models/app_notif.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/services/notification_service.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';

abstract class NotifApiCtl {
  static Future<DataResponse<List<AppNotif>>> getAllNotifs(int userId) async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/notifications?user=$userId',
        options: Options(headers: WebConst.authHeaders),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(
            data: (res.data as List).map((e) => AppNotif.fromJson(e)).toList());
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static Future<DataResponse<bool>> updateFcmToken(String? oldToken) async {
    try {
      var newToken = await NotificationService.getFcmToken();
      if (newToken != null && newToken != oldToken) {
        var res = await WebConst.client.patch(
          '${Const.baseUrl}/api/notifications',
          data: {"fcmToken": newToken},
          options: Options(
            headers: WebConst.authHeaders
              ..update(
                "Content-Type",
                (e) => "application/merge-patch+json",
              ),
          ),
        );

        if (res.statusCode == 200) {
          return DataResponse.success(data: true);
        } else {
          return DataResponse.error(systemError: res.data);
        }
      } else {
        return DataResponse.success(data: true);
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }
}
