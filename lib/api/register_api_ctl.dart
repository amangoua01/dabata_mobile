import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';

abstract class RegisterApiCtl {
  static Future<DataResponse<User>> register(User user) async {
    try {
      print("user ${user.toJson()}");
      print('URL: ${Const.baseUrl}/api/users');

      var res = await WebConst.client.post(
        '${Const.baseUrl}/api/users',
        data: user.toJson(),
        options: Options(headers: WebConst.headers),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(data: User.fromJson(res.data['data']));
      } else {
        return DataResponse.error(
            message: res.data["message"] ?? "Une erreur s'est produite");
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }
}
