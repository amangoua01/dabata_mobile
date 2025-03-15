import 'package:dabata_mobile/api/user_api_ctl.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserListSubPageVctl extends GetxController {
  List<User> users = [];

  Future<void> fetchAllUsers() async {
    var res = await UserApiCtl.getAllUser();
    if (res.status) {
      users = res.data!;
      print("users List ${users.map((e) => e.toJson())}");
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
    fetchAllUsers();
  }
}
