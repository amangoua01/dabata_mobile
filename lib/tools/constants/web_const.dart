import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class WebConst {
  static final RxString _jwt = RxString('');
  static String get jwt => _jwt.value;
  static set jwt(String value) => _jwt.value = value;

  static final client = Dio();

  static Map<String, String> get headers => {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

  static Map<String, String> get authHeaders => {
        ...headers,
        if (jwt.isNotEmpty) "Authorization": "Bearer $jwt",
      };

  /*  static String get jwt => Get.find(tag: "jwt");
  static set jwt(String value) => Get.put<String>(
        value,
        tag: "jwt",
      );

  static final client = Dio();

  static Map<String, String> get headers => {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

  static Map<String, String> get authHeaders => headers
    ..addAll({
      "Authorization": "Bearer $jwt",
    }); */

  static Map<String, String> get multipartHeaders => {
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
      };

  static Map<String, String> get authMultipartHeaders => multipartHeaders
    ..addAll({
      "Authorization": "Bearer $jwt",
    });
}
