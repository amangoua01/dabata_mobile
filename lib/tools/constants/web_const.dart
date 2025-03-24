import 'dart:convert';

import 'package:dabata_mobile/models/auth_user.dart';
import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/tools/constants/cache_key.dart';
import 'package:dabata_mobile/tools/constants/const.dart';
import 'package:dabata_mobile/tools/extensions/types/map.dart';
import 'package:dabata_mobile/tools/web/data_response.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

abstract class WebConst {
  static String get jwt {
    if (Get.isRegistered<String>(tag: CacheKey.jwt.name)) {
      return Get.find<String>(tag: CacheKey.jwt.name);
    } else {
      return "";
    }
  }

  static set jwt(String value) {
    if (Get.isRegistered<String>(tag: CacheKey.jwt.name)) {
      Get.replace<String>(value, tag: CacheKey.jwt.name);
    } else {
      Get.put<String>(value, tag: CacheKey.jwt.name, permanent: true);
    }
  }

  static Future<String?> getRefreshJwt() async =>
      Cache.getString(CacheKey.refreshJwt.name);

  static setRefreshJwt(String value) =>
      Cache.setString(CacheKey.refreshJwt.name, value);

  // Le reste du code reste identique
  static final client = Dio();

  static Map<String, String> get headers => {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

  static Map<String, String> get authHeaders => headers
    ..addAll({
      "Authorization": "Bearer $jwt",
    });

  static Future<DataResponse<String>> refreshToken() async {
    try {
      if (tokenIsValid(jwt)) {
        return DataResponse.success(data: jwt);
      } else {
        var refreshToken = await getRefreshJwt();
        if (refreshToken != null) {
          var res = await WebConst.client.post(
            '${Const.baseUrl}/token/refresh',
            data: {"refresh_token": refreshToken},
            options: Options(headers: WebConst.authHeaders),
          );
          if (res.statusCode == 200) {
            var authUser = await _getUserFromCache();
            if (authUser != null) {
              authUser.jwt = res.data['token'];
              Cache.setString(CacheKey.authUser.name, authUser.toJson());
              WebConst.jwt = res.data['token'];
              return DataResponse.success(data: res.data['token']);
            }
            return DataResponse.error(
                message:
                    "Nous n'avons pas pu mettre à jour le token. Veuillez vous reconnecter.");
          } else {
            return DataResponse.error(
                message: res.data["message"] ?? "Une erreur s'est produite");
          }
        } else {
          return DataResponse.error(
              message:
                  "Nous n'avons pas pu mettre à jour le token. Veuillez vous reconnecter.");
        }
      }
    } catch (e, st) {
      return DataResponse.error(systemError: e, systemtraceError: st);
    }
  }

  static bool tokenIsValid(String token) {
    Json decodedToken = JwtDecoder.decode(token);
    return decodedToken['exp'] > DateTime.now().millisecondsSinceEpoch / 1000;
  }

  static Future<AuthUser?> _getUserFromCache() async {
    final value = await Cache.getString(CacheKey.authUser.name);
    if (value != null) {
      var authUser = AuthUser.fromJson(jsonDecode(value));
      WebConst.jwt = authUser.jwt ?? "";
      return authUser;
    } else {
      return null;
    }
  }
}
