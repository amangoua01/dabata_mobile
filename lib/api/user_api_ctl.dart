import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';

abstract class UserApiCtl {
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
        //print("user logged ${res.data['data']}");
        WebConst.jwt = res.data['token'];
        Cache.setString("jwt", res.data['token']);
        return DataResponse.success(data: User.fromJson(res.data['data']));
      } else {
        return DataResponse.error(
            message: res.data["message"] ?? "Une erreur s'est produite");
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static Future<DataResponse<List<User>>> getAllUser() async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/users',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        //print("users ${res.data}");
        return DataResponse.success(
            data: (res.data as List).map((e) => User.fromJson(e)).toList());
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } on DioException catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }
  /* static Future<DataResponse<User>> getUser() async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/users/me',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(data: User.fromJson(res.data['data']));
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } on DioException catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  } */

  static Future<DataResponse<User>> updateUser(User user) async {
    try {
      var res = await WebConst.client.put(
        '${Const.baseUrl}/api/users/${user.id}',
        data: user.toJson(),
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(data: User.fromJson(res.data['data']));
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
