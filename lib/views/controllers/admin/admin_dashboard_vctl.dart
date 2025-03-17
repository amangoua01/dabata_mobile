import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/articles_sub_page.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/dashboard_sub_page.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/paiement_sub_page.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/settings_sub_page.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/users_list_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AdminDashboardVctl extends GetxController {
  var selectedIndex = 0;

  List<Widget> pages = [
    const DashboardSubPage(),
    const UsersListSubPage(),
    const ArticlesSubPage(),
    const PaiementSubPage(),
    const SettingsSubPage(),
  ];
}
