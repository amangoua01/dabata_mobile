import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserCardDetailPageVctl extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void onInit() {
    controller = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
