import 'package:dabata_mobile/tools/constants/cache_key.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

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
      Get.put<String>(value, tag: CacheKey.jwt.name);
    }
  }

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
}
