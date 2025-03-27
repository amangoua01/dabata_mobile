import 'package:dabata_mobile/models/auth_user.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';

abstract class UserApiCtl {
  static Future<DataResponse<User>> register(User user) async {
    try {
      var res = await WebConst.client.post(
        '${Const.baseUrl}/api/users',
        data: user.toJson(),
        options: Options(headers: WebConst.headers),
      );
      if (res.statusCode == 201) {
        return DataResponse.success(data: User.fromJson(res.data));
      } else {
        return DataResponse.error(
          message: res.data["message"] ?? "Une erreur s'est produite",
        );
      }
    } on DioException catch (e, st) {
      if (e.response?.statusCode == 422) {
        return DataResponse.error(
            message: e.response?.data["detail"],
            systemError: e,
            systemtraceError: st);
      }
      return DataResponse.error(systemError: e, systemtraceError: st);
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static Future<DataResponse<AuthUser>> login(
      {required String email, required String password}) async {
    try {
      var res = await WebConst.client.post(
        '${Const.baseUrl}/auth',
        data: {
          "email": email,
          "password": password,
        },
        options: Options(headers: WebConst.headers),
      );
      if (res.statusCode == 200) {
        WebConst.jwt = res.data['token'];
        Cache.setString("jwt", res.data['token']);
        return DataResponse.success(data: AuthUser.fromJson(res.data));
      } else {
        return DataResponse.error(
            message: res.data["message"] ?? "Une erreur s'est produite");
      }
    } on DioException catch (e, st) {
      if (e.response?.statusCode == 401) {
        return DataResponse.error(
          message: "Email ou mot de passe incorrect",
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

  static Future<DataResponse<User>> getUser(String uuid) async {
    try {
      var res = await WebConst.client.get(
        '${Const.baseUrl}/api/users/$uuid',
        options: Options(
          headers: WebConst.authHeaders,
        ),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(data: User.fromJson(res.data));
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } on DioException catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static Future<DataResponse<User>> updateUser(User user) async {
    try {
      var res = await WebConst.client.patch(
        '${Const.baseUrl}/api/users/${user.uuId}',
        data: {
          'nom': user.nom,
          'email': user.email,
          'prenom': user.prenom,
          'telephone': user.telephone,
          'lieuResidence': user.lieuResidence,
        },
        options: Options(
          headers: WebConst.authHeaders
            ..update(
              "Content-Type",
              (e) => "application/merge-patch+json",
            ),
        ),
      );

      if (res.statusCode == 200) {
        return DataResponse.success(data: User.fromJson(res.data));
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } on DioException catch (e, st) {
      if (e.response?.statusCode == 422) {
        return DataResponse.error(
            message: e.response?.data["detail"],
            systemError: e,
            systemtraceError: st);
      }
      return DataResponse.error(systemError: e, systemtraceError: st);
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static Future<DataResponse<bool>> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      var res = await WebConst.client.post(
        '${Const.baseUrl}/api/users/change-password',
        data: {
          "currentPassword": oldPassword,
          "newPassword": newPassword,
        },
        options: Options(headers: WebConst.authHeaders),
      );
      if (res.statusCode == 200) {
        return DataResponse.success(data: true);
      } else {
        return DataResponse.error(systemError: res.data);
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }
}
