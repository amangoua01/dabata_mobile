import 'package:dabata_mobile/api/notif_api_ctl.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/dashboard_sub_admin_page.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/paiement_sub_page.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/settings_sub_page.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/souscription_sub_page.dart';
import 'package:dabata_mobile/views/static/admin/home/dashboard_sub_pages/users_list_sub_page.dart';
import 'package:flutter/material.dart';

class AdminDashboardVctl extends AuthViewController {
  var selectedIndex = 0;

  List<Widget> pages = [
    const DashboardSubAdminPage(),
    const UsersListSubPage(),
    const SouscriptionSubPage(),
    const PaiementSubPage(),
    const SettingsSubPage(),
  ];

  @override
  void onReady() {
    NotifApiCtl.updateFcmToken(user?.fcmToken);
    super.onReady();
  }
}
