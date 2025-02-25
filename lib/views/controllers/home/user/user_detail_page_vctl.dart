import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

class UserDetailPageVctl extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void onInit() {
    controller = TabController(length: 3, vsync: this);
    super.onInit();
  }
}
