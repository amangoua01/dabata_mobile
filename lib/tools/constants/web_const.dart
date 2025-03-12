import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class WebConst {
  static String get jwt => Get.find(tag: "jwt");
  static set jwt(String value) {
    try {
      Get.find<String>(tag: "jwt");
      Get.replace<String>(value, tag: "jwt");
    } catch (e) {
      Get.put<String>(value, tag: "jwt");
    }
  }

  static final client = Dio();

  static Map<String, String> get headers => {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

  static Map<String, String> get authHeaders => headers
    ..addAll({
      "Authorization": "Bearer $jwt",
    });

  static Map<String, String> get multipartHeaders => {
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
      };

  static Map<String, String> get authMultipartHeaders => multipartHeaders
    ..addAll({
      "Authorization": "Bearer $jwt",
    });
}
