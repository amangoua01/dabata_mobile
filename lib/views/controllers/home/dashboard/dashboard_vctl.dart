import 'package:dabata_mobile/api/notif_api_ctl.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/home/dashboard/dashboard_sub_page.dart';
import 'package:dabata_mobile/views/static/home/dashboard/gains_sub_page.dart';
import 'package:dabata_mobile/views/static/home/dashboard/historique_sub_page.dart';
import 'package:flutter/material.dart';

class DashboardVctl extends AuthViewController {
  int currentPage = 0;

  List<Widget> pages = const [
    DashboardSubPage(),
    HistoriqueSubPage(),
    GainsSubPage(),
  ];

  @override
  void onReady() {
    NotifApiCtl.updateFcmToken(user?.fcmToken);
    super.onReady();
  }
}
