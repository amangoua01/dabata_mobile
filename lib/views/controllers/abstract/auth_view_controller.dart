import 'dart:convert';

import 'package:dabata_mobile/models/auth_user.dart';
import 'package:get/get.dart';

abstract class AuthViewController extends GetxController {
  String get jwt {
    if (Get.isRegistered(tag: "jwt")) {
      return Get.find<String>(tag: "jwt");
    } else {
      return "";
    }
  }

  set jwt(String value) {
    if (Get.isRegistered(tag: "jwt")) {
      Get.replace<String>(value, tag: "jwt");
    } else {
      Get.put<String>(value, tag: "jwt");
    }
  }

  AuthUser? get authUser {
    if (Get.isRegistered(tag: "authUser")) {
      return Get.find<AuthUser>(tag: "authUser");
    }
    return null;
  }

  set authUser(AuthUser? value) {
    if (Get.isRegistered(tag: "authUser")) {
      Get.replace(value!);
    } else {
      Get.put<AuthUser>(value!, permanent: true);
    }
  }

  AuthUser userFromCache(String value) {
    authUser = AuthUser.fromJson(jsonDecode(value));
    return authUser!;
  }
}
