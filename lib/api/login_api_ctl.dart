import 'package:dio/dio.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';

abstract class LoginApiCtl {
  static Future<DataResponse<User>> login(User user) async {
    try {
      //print("user ${user.toJson()}");
      var res = await WebConst.client.post(
        '${Const.baseUrl}/auth',
        data: {
          "email": user.email,
          "password": user.password,
        },
        options: Options(headers: WebConst.headers),
      );
      if (res.statusCode == 200) {
        //print("user logged ${res.data['token']}");
        WebConst.jwt = res.data['token'];
        //print("Token utilisé pour la requête: ${WebConst.jwt}");
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
