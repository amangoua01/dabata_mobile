import 'dart:convert';

import 'package:dabata_mobile/models/auth_user.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/cache/cache.dart';
import 'package:dabata_mobile/tools/constants/cache_key.dart';
import 'package:dabata_mobile/tools/constants/web_const.dart';
import 'package:get/get.dart';

abstract class AuthViewController extends GetxController {
 

  AuthUser? get authUser {
    if (Get.isRegistered<AuthUser>(tag: CacheKey.authUser.name)) {
      return Get.find<AuthUser>(tag: CacheKey.authUser.name);
    }
    return null;
  }

  set authUser(AuthUser? value) {
    if (Get.isRegistered<AuthUser>(tag: CacheKey.authUser.name)) {
      Get.replace(value!, tag: CacheKey.authUser.name);
    } else {
      Get.put<AuthUser>(
        value!,
        tag: CacheKey.authUser.name,
        permanent: true,
      );
    }
    Cache.setString(CacheKey.authUser.name, value.toJson());
    update();
  }

  Future<AuthUser?> getUserFromCache() async {
    final value = await Cache.getString(CacheKey.authUser.name);
    if (value != null) {
      authUser = AuthUser.fromJson(jsonDecode(value));
      WebConst.jwt = authUser?.jwt ?? "";
      return authUser!;
    } else {
      return null;
    }
  }

  User? get user => authUser?.user;
}
