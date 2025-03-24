import 'package:dabata_mobile/api/notif_api_ctl.dart';
import 'package:dabata_mobile/models/app_notif.dart';
import 'package:dabata_mobile/tools/alert_widgets/c_alert_dialog.dart';
import 'package:dabata_mobile/tools/extensions/types/int.dart';
import 'package:dabata_mobile/views/controllers/abstract/auth_view_controller.dart';

class ListNotifPageVtl extends AuthViewController {
  bool isLoading = false;
  List<AppNotif> notifs = [];

  Future<void> getNotifs() async {
    isLoading = true;
    update();
    var res = await NotifApiCtl.getAllNotifs(user!.id.value);
    isLoading = false;
    update();
    if (res.status) {
      notifs = res.data!;
      update();
    } else {
      CAlertDialog.show(message: res.message);
    }
  }

  @override
  void onReady() {
    getNotifs();
    super.onReady();
  }
}
