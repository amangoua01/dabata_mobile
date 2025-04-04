import 'package:dabata_mobile/tools/constants/app_env.dart';

abstract class Const {
  static const String appName = "Dabata";
  static const String appVersion = "1.0.0";
  static const env = AppEnv.dev;
  static const String _baseUrlProd = "https://dabata-api-prod.visium.ci";
  static const String _baseUrlDev = "https://dabata-api-dev.visium.ci";
  static const String supportTel = "+2250707887176";

  static String buildUrl({bool withSuffixApi = true, String? path}) {
    String url;
    if (env == AppEnv.dev) {
      url = _baseUrlDev;
    } else {
      url = _baseUrlProd;
    }
    if (withSuffixApi) {
      url = "$url/api";
    }
    if (path != null) {
      url = "$url/$path";
    }
    return url;
  }
}
