import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dabata_mobile/views/static/home/dashboard/gains_sub_page.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard.dart';
import 'package:dabata_mobile/views/static/home/dashboard/historique_sub_page.dart';

class HomeVctl extends GetxController {
  var selectedIndex = 0;

  List<Widget> pageList = [
    const Dashboard(),
    const HistoriqueSubPage(),
    const GainsSubPage(),
  ];

  void onTabChange(int i) {
    selectedIndex = i;
    update();
  }
}
