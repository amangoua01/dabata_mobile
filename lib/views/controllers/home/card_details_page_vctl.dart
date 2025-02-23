import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetailsPageVctl extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void onInit() {
    controller = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
