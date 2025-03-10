import 'package:flutter/foundation.dart';

class DataResponse<T> {
  bool status = false;
  T? data;
  String message = "Désolé, une erreur est survenue. Veuillez réessayer SVP.";
  String detailErrors = "";

  DataResponse.success({required this.data})
      : status = true,
        message = "";

  DataResponse.error(
      {this.message =
          "Désolé, une erreur est survenue. Veuillez réessayer SVP.",
      this.detailErrors = "",
      dynamic systemError,
      dynamic systemtraceError}) {
    if (kDebugMode && systemError != null) {
      //Sentry.captureException(systemError, stackTrace: systemtraceError);
      print(systemError);
      print(systemtraceError);
    }
  }
}
