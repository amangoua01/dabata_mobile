import 'package:dabata_mobile/tools/constants/env.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CSnackbar {
  static SnackbarController show({
    String title = Env.appName,
    required String message,
  }) {
    return Get.snackbar(
      title,
      message,
      backgroundColor: Colors.white,
    );
  }
}
